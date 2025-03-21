# frozen_string_literal: true

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "google/api/annotations_pb"
require "google/api/client_pb"
require "google/api/field_behavior_pb"
require "google/api/resource_pb"
require "google/api/routing_pb"
require "google/cloud/extended_operations_pb"
require "google/longrunning/operations_pb"
require "google/protobuf/descriptor_pb"
require "gapic/schema/proto_tools"
require "gapic/schema/wrappers"

module Gapic
  module Schema
    # Loader
    class Loader
      # Initializes the loader
      def initialize
        @prior_messages = []
        @prior_enums = []
      end

      FILE_EXTENSION_NAMES = {
        "google.api.resource_definition" => [1053, ::Google::Api::ResourceDescriptor, :repeated]
      }.freeze

      MESSAGE_EXTENSION_NAMES = {
        "google.api.resource" => [1053, ::Google::Api::ResourceDescriptor]
      }.freeze

      # Loads a file.
      #
      # @param file_descriptor [Google::Protobuf::FileDescriptorProto] the
      #   descriptor of the proto file.
      # @param file_to_generate [Boolean] Whether this file is to be
      #   generated.
      # @return [Gapic::Schema::File]
      def load_file file_descriptor, file_to_generate
        # Setup.
        address = file_descriptor.package.split "."
        path = []
        registry = {}

        # Load the docs.
        location = file_descriptor.source_code_info.location || []
        docs = location.each_with_object({}) { |l, ans| ans[l.path.to_a] = l }

        # Load top-level enums.
        enums = (file_descriptor.enum_type || []).each_with_index.map do |e, i|
          load_enum registry, e, address, docs, [5, i]
        end

        # Load top-level messages.
        messages = (file_descriptor.message_type || []).each_with_index.map do |m, i|
          load_message registry, m, address, docs, [4, i]
        end
        messages.each(&method(:update_fields!))

        # Load services.
        services = (file_descriptor.service || []).each_with_index.map do |s, i|
          load_service registry, s, address, docs, [6, i]
        end

        # Load top-level resources
        option_extensions = ProtoTools.parse_options_extensions file_descriptor.options, FILE_EXTENSION_NAMES
        resource_descriptors = option_extensions["google.api.resource_definition"]
        resources = Array(resource_descriptors).map { |descriptor| Resource.new descriptor }

        # Construct and return the file.
        File.new file_descriptor, address, docs[path], messages, enums,
                 services, resources, file_to_generate, registry
      end

      ##
      # Loads snippet configs from the given directory
      #
      # @param path [String] Directory to search for snippet config files
      # @return [Array<
      #   Google::Cloud::Tools::SnippetGen::ConfigLanguage::V1::SnippetConfig>]
      #
      def load_snippet_configs path
        return [] unless path
        Dir.chdir path do
          Dir.glob("**/*.json").map do |file_path|
            json = JSON.load_file file_path
            proto = Google::Cloud::Tools::SnippetGen::ConfigLanguage::V1::SnippetConfig.new underscore_keys json
            proto.json_representation = json
            proto
          end
        end
      end

      # Updates the fields of a message and it's nested messages.
      #
      # @param message [Message] the message whose fields and nested messages
      #    to update.
      def update_fields! message
        message.nested_messages.each(&method(:update_fields!))
        non_primitives = message.fields.reject { |f| f.type_name.empty? }
        non_primitives.each do |f|
          f.message ||= cached_message f.type_name
          f.enum ||= cached_enum f.type_name
        end
      end

      # Loads an enum.
      #
      # @param descriptor [Google::Protobuf::EnumDescriptorProto] the
      #   descriptor of this enum.
      # @param address [Enumerable<String>] The address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [Enum] The loaded enum.
      def load_enum registry, descriptor, address, docs, path
        # Update Address.
        address = address.clone << descriptor.name

        # Load Enum Values
        values = (descriptor.value || []).each_with_index.map do |value, i|
          load_enum_value registry, value, address, docs, path + [2, i]
        end

        # Construct, cache and return enum.
        enum = Enum.new descriptor, address, docs[path], values
        @prior_enums << enum
        add_to_registry registry, address, enum
      end

      # Loads an enum value.
      #
      # @param descriptor [Google::Protobuf::EnumValueDescriptorProto] the
      #   descriptor of this enum value.
      # @param address [Enumerable<String>] the address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [EnumValue] The loaded enum value.
      def load_enum_value registry, descriptor, address, docs, path
        # Update Address.
        address = address.clone << descriptor.name

        # Construct and return value.
        enum_value = EnumValue.new descriptor, address, docs[path]
        add_to_registry registry, address, enum_value
      end

      # Loads a message. As a side effect, this alters @messages and @enums
      # with the nested messages that are found.
      #
      # @param descriptor [Google::Protobuf::DescriptorProto] the
      #   descriptor of this message.
      # @param address [Enumerable<String>] the address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [Message] The loaded message.
      def load_message registry, descriptor, address, docs, path
        # Update Address.
        address = address.clone << descriptor.name

        # Load Children
        nested_messages = (descriptor.nested_type || []).each_with_index.map do |m, i|
          load_message registry, m, address, docs, path + [3, i]
        end
        nested_enums = (descriptor.enum_type || []).each_with_index.map do |e, i|
          load_enum registry, e, address, docs, path + [4, i]
        end
        fields = (descriptor.field || []).each_with_index.map do |f, i|
          load_field registry, f, address, docs, path + [2, i]
        end
        fields.each { |field| field.populate_oneof_siblings! fields }
        extensions = (descriptor.extension || []).each_with_index.map do |e, i|
          load_field registry, e, address, docs, path + [6, i]
        end

        option_extensions = ProtoTools.parse_options_extensions descriptor.options, MESSAGE_EXTENSION_NAMES
        resource_descriptor = option_extensions["google.api.resource"]
        resource = resource_descriptor ? Resource.new(resource_descriptor) : nil

        # Construct, cache, and return.
        msg = Message.new(descriptor, address, docs[path], fields, extensions,
                          resource, nested_messages, nested_enums)
        @prior_messages << msg
        add_to_registry registry, address, msg
      end

      # Loads a field.
      #
      # @param descriptor [Google::Protobuf::FieldDescriptorProto] the
      #   descriptor of this field.
      # @param address [Enumerable<String>] The address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [Field] The loaded field.
      def load_field registry, descriptor, address, docs, path
        # Update address.
        address = address.clone << descriptor.name

        # Construct and return the field.
        field = Field.new(descriptor, address, docs[path],
                          cached_message(descriptor.type_name), cached_enum(descriptor.type_name))
        add_to_registry registry, address, field
      end

      # Loads a service.
      #
      # @param descriptor [Google::Protobuf::ServiceDescriptorProto] the
      #   descriptor of this service.
      # @param address [Enumerable<String>] The address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [Service] The loaded service.
      def load_service registry, descriptor, address, docs, path
        # Update the address.
        address = address.clone << descriptor.name

        # Load children
        methods = (descriptor["method"] || descriptor.method || []).each_with_index.map do |m, i|
          load_method registry, m, address, docs, path + [2, i]
        end

        # Construct and return the service.
        service = Service.new descriptor, address, docs[path], methods
        add_to_registry registry, address, service
      end

      # Loads a method.
      #
      # @param descriptor [Google::Protobuf::MethodDescriptorProto] the
      #   descriptor of this service.
      # @param address [Enumerable<String>] The address of the parent.
      # @param docs [Hash<Enumerable<Integer>,
      #   Google::Protobuf::SourceCodeInfo::Location>]
      #   A mapping of a path to the docs. See Proto#docs for more info.
      # @param path [Enumerable<Integer>] The current path. This is used to
      #   get the docs for a proto. See Proto#docs for more info.
      # @return [Method] The loaded method.
      def load_method registry, descriptor, address, docs, path
        # Update the address.
        address = address.clone << descriptor.name

        # Construct and return the method.
        method = Method.new(descriptor, address, docs[path],
                            cached_message(descriptor.input_type), cached_message(descriptor.output_type))
        add_to_registry registry, address, method
      end

      # Retrieves an Enum if it has been seen before.
      #
      # @param type_name [String] the type name of the enum.
      # @return [Enum | nil] The enum if it has already been seen or nil if
      #   no enum can be found.
      def cached_enum type_name
        cached_obj @prior_enums, type_name
      end

      # Retrieves a Message if it has been seen before.
      #
      # @param type_name [String] the type name of the message.
      # @return [Enum | nil] The message if it has already been seen or nil if
      #   no message can be found.
      def cached_message type_name
        cached_obj @prior_messages, type_name
      end

      private

      ##
      # Transforms all keys in the given hash to snake case.
      #
      def underscore_keys input
        case input
        when Hash
          input.to_h { |key, value| [ActiveSupport::Inflector.underscore(key), underscore_keys(value)] }
        when Array
          input.map { |elem| underscore_keys elem }
        else
          input
        end
      end

      def add_to_registry registry, address, obj
        registry[address.join(".")] = obj
        obj
      end

      def cached_obj collection, type_name
        # Remove leading dot.
        type_name = type_name[1..] if type_name && type_name[0] == "."

        # Create an address from the type & check cache.
        collection.find { |m| m.address == type_name.split(".") }
      end
    end
  end
end
