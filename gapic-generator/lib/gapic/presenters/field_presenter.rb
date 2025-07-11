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

require "active_support/inflector"
require "gapic/helpers/namespace_helper"

module Gapic
  module Presenters
    ##
    # A presenter for proto fields.
    #
    class FieldPresenter
      include Gapic::Helpers::NamespaceHelper

      # @return [String] String representation of this presenter type.
      attr_reader :type

      ##
      # @param api [Gapic::Schema::Api]
      # @param message [Gapic::Schema::Message]
      # @param field [Gapic::Schema::Field]
      #
      def initialize api, message, field
        @api = api
        @message = message
        @field = field
        @type = "field"
      end

      def name
        @field.name
      end

      ##
      # @return [String] The field name to be used as a value without reserved keywords.
      #
      def value_name
        name = @field.name
        Gapic::RubyInfo.keywords.include?(name) ? "#{name}_param" : name
      end

      def doc_types
        field_doc_types @field, false
      end

      def doc_attribute_type
        mode = @field.output_only? ? "r" : "rw"
        "@!attribute [#{mode}] #{@field.name}"
      end

      def output_doc_types
        field_doc_types @field, true
      end

      ##
      # The description as it should appear in YARD docs.
      #
      # @param transport [:grpc,:rest] Whether xref links should go to REST or
      #   gRPC client classes. Uses the default transport if not provided.
      # @return [String]
      #
      def doc_description transport: nil, is_rpc_param: false
        @field.docs_leading_comments transport: transport, is_rpc_param: is_rpc_param
      end

      def default_value
        single = default_singular_value
        return "[#{single}]" if @field.repeated? && !@field.map?
        single
      end

      def as_kwarg value: nil
        "#{name}: #{value || value_name}"
      end

      # TODO: remove, only used in tests
      def type_name
        @field.type_name
      end

      def type_name_full
        return nil if type_name.blank?
        ruby_namespace @api, type_name
      end

      def message?
        @field.message?
      end

      def enum?
        @field.enum?
      end

      def proto3_optional?
        @field.proto3_optional?
      end

      def repeated?
        @field.repeated?
      end

      def required?
        @field.required?
      end

      def map?
        @field.map?
      end

      def oneof?
        @field.oneof?
      end

      def oneof_name
        @message.oneof_decl[@field.oneof_index].name
      end

      ##
      # Returns a stringified default value for the protobuf types
      # that are possible to fit into the query string parameter
      # and nil for the other types (e.g. Messages)
      #
      # @return [String, nil]
      #
      def default_value_for_type
        if @field.message?
          nil
        elsif @field.enum?
          ":#{@field.enum.values.first.name}"
        else
          case @field.type
          when 1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18 then "0" # floating point or integer
          when 9, 12                                   then "\"\""
          when 8                                       then "false"
          end
        end
      end

      ##
      # Name of this field, camel-cased.
      # @return [String]
      #
      def camel_name
        camel_name_for name
      end

      ##
      # @return [Boolean] Whether the field is marked as deprecated.
      #
      def is_deprecated?
        @field.is_deprecated?
      end

      protected

      # @private
      FIELD_TYPE_MAPPING = {
        TYPE_DOUBLE: "::Float",
        TYPE_FLOAT: "::Float",
        TYPE_INT64: "::Integer",
        TYPE_UINT64: "::Integer",
        TYPE_INT32: "::Integer",
        TYPE_FIXED64: "::Integer",
        TYPE_FIXED32: "::Integer",
        TYPE_BOOL: "::Boolean",
        TYPE_STRING: "::String",
        TYPE_BYTES: "::String",
        TYPE_UINT32: "::Integer",
        TYPE_SFIXED32: "::Integer",
        TYPE_SFIXED64: "::Integer",
        TYPE_SINT32: "::Integer",
        TYPE_SINT64: "::Integer"
      }.freeze

      # @private
      FIELD_VALUE_MAPPING = {
        TYPE_DOUBLE: "3.5",
        TYPE_FLOAT: "3.5",
        TYPE_INT64: "42",
        TYPE_UINT64: "42",
        TYPE_INT32: "42",
        TYPE_FIXED64: "42",
        TYPE_FIXED32: "42",
        TYPE_BOOL: "true",
        TYPE_STRING: "\"hello world\"",
        TYPE_BYTES: "\"hello world\"",
        TYPE_UINT32: "42",
        TYPE_SFIXED32: "42",
        TYPE_SFIXED64: "42",
        TYPE_SINT32: "42",
        TYPE_SINT64: "42"
      }.freeze

      def field_doc_types field, output
        return field_map_type field.message, output if field.map?
        base_type =
          if field.message?
            type = message_ruby_type field.message
            output ? type : "#{type}, ::Hash"
          elsif field.enum?
            # TODO: handle when arg message is nil and enum is the type
            message_ruby_type field.enum
          else
            FIELD_TYPE_MAPPING[field.type] || "::Object"
          end
        field.repeated? ? "::Array<#{base_type}>" : base_type
      end

      def field_map_type entry_message, output
        key_field = value_field = nil
        entry_message.fields.each do |field|
          key_field = field if field.name == "key"
          value_field = field if field.name == "value"
        end
        class_name = output ? "::Google::Protobuf::Map" : "::Hash"
        if key_field && value_field
          key_type = field_doc_types key_field, output
          value_type = field_doc_types value_field, output
          "#{class_name}{#{key_type} => #{value_type}}"
        else
          class_name
        end
      end

      def default_singular_value
        if @field.message?
          "{}"
        elsif @field.enum?
          # TODO: select the first non-0 enum value
          ":#{@field.enum.values.first.name}"
        else
          # BUG: This should default to a better value
          FIELD_VALUE_MAPPING[@field.type] || "::Object"
        end
      end

      def message_ruby_type message
        ruby_namespace @api, message.address.join(".")
      end

      ##
      # Converts a snake_case parameter name into camelCase for query string parameters
      # @param attr_name [String]
      # @return [String] camel-cased parameter name
      def camel_name_for attr_name
        parts = attr_name.split "_"
        first_part = parts[0]
        other_parts = parts[1..]
        other_parts_pascal = other_parts.map(&:capitalize).join
        "#{first_part}#{other_parts_pascal}"
      end
    end
  end
end
