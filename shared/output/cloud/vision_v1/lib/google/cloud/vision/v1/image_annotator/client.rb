# frozen_string_literal: true

# Copyright 2022 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/errors"
require "google/cloud/vision/v1/image_annotator_pb"
require "google/cloud/location"

module Google
  module Cloud
    module Vision
      module V1
        module ImageAnnotator
          ##
          # Client for the ImageAnnotator service.
          #
          # Service that performs Google Cloud Vision API detection tasks over client
          # images, such as face, landmark, logo, label, and text detection. The
          # ImageAnnotator service returns detected entities from the images.
          #
          class Client
            include Paths

            # @private
            attr_reader :image_annotator_stub

            ##
            # Configure the ImageAnnotator Client class.
            #
            # See {::Google::Cloud::Vision::V1::ImageAnnotator::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all ImageAnnotator clients
            #   ::Google::Cloud::Vision::V1::ImageAnnotator::Client.configure do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "Vision", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the ImageAnnotator Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Cloud::Vision::V1::ImageAnnotator::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new ImageAnnotator client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Cloud::Vision::V1::ImageAnnotator::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the ImageAnnotator client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/cloud/vision/v1/image_annotator_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              # Use self-signed JWT if the endpoint is unchanged from default,
              # but only if the default endpoint does not have a region prefix.
              enable_self_signed_jwt = @config.endpoint == Client.configure.endpoint &&
                                       !@config.endpoint.split(".").first.include?("-")
              credentials ||= Credentials.default scope: @config.scope,
                                                  enable_self_signed_jwt: enable_self_signed_jwt
              if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end
              @quota_project_id = @config.quota_project
              @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

              @operations_client = Operations.new do |config|
                config.credentials = credentials
                config.quota_project = @quota_project_id
                config.endpoint = @config.endpoint
              end

              @location_client = Google::Cloud::Location::Locations::Client.new do |config|
                config.credentials = credentials
                config.quota_project = @quota_project_id
                config.endpoint = @config.endpoint
              end

              @image_annotator_stub = ::Gapic::ServiceStub.new(
                ::Google::Cloud::Vision::V1::ImageAnnotator::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            ##
            # Get the associated client for long-running operations.
            #
            # @return [::Google::Cloud::Vision::V1::ImageAnnotator::Operations]
            #
            attr_reader :operations_client

            ##
            # Get the associated client for mix-in of the Locations.
            #
            # @return [Google::Cloud::Location::Locations::Client]
            #
            attr_reader :location_client

            # Service calls

            ##
            # Run image detection and annotation for a batch of images.
            #
            # @overload batch_annotate_images(request, options = nil)
            #   Pass arguments to `batch_annotate_images` via a request object, either of type
            #   {::Google::Cloud::Vision::V1::BatchAnnotateImagesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::Vision::V1::BatchAnnotateImagesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload batch_annotate_images(requests: nil, parent: nil)
            #   Pass arguments to `batch_annotate_images` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param requests [::Array<::Google::Cloud::Vision::V1::AnnotateImageRequest, ::Hash>]
            #     Required. Individual image annotation requests for this batch.
            #   @param parent [::String]
            #     Optional. Target project and location to make a call.
            #
            #     Format: `projects/{project-id}/locations/{location-id}`.
            #
            #     If no parent is specified, a region will be chosen automatically.
            #
            #     Supported location-ids:
            #         `us`: USA country only,
            #         `asia`: East asia areas, like Japan, Taiwan,
            #         `eu`: The European Union.
            #
            #     Example: `projects/project-A/locations/eu`.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::Vision::V1::BatchAnnotateImagesResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::Vision::V1::BatchAnnotateImagesResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/vision/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::Vision::V1::BatchAnnotateImagesRequest.new
            #
            #   # Call the batch_annotate_images method.
            #   result = client.batch_annotate_images request
            #
            #   # The returned object is of type Google::Cloud::Vision::V1::BatchAnnotateImagesResponse.
            #   p result
            #
            def batch_annotate_images request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Vision::V1::BatchAnnotateImagesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.batch_annotate_images.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Vision::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              options.apply_defaults timeout:      @config.rpcs.batch_annotate_images.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.batch_annotate_images.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @image_annotator_stub.call_rpc :batch_annotate_images, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Service that performs image detection and annotation for a batch of files.
            # Now only "application/pdf", "image/tiff" and "image/gif" are supported.
            #
            # This service will extract at most 5 (customers can specify which 5 in
            # AnnotateFileRequest.pages) frames (gif) or pages (pdf or tiff) from each
            # file provided and perform detection and annotation for each image
            # extracted.
            #
            # @overload batch_annotate_files(request, options = nil)
            #   Pass arguments to `batch_annotate_files` via a request object, either of type
            #   {::Google::Cloud::Vision::V1::BatchAnnotateFilesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::Vision::V1::BatchAnnotateFilesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload batch_annotate_files(requests: nil, parent: nil)
            #   Pass arguments to `batch_annotate_files` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param requests [::Array<::Google::Cloud::Vision::V1::AnnotateFileRequest, ::Hash>]
            #     Required. The list of file annotation requests. Right now we support only
            #     one AnnotateFileRequest in BatchAnnotateFilesRequest.
            #   @param parent [::String]
            #     Optional. Target project and location to make a call.
            #
            #     Format: `projects/{project-id}/locations/{location-id}`.
            #
            #     If no parent is specified, a region will be chosen automatically.
            #
            #     Supported location-ids:
            #         `us`: USA country only,
            #         `asia`: East asia areas, like Japan, Taiwan,
            #         `eu`: The European Union.
            #
            #     Example: `projects/project-A/locations/eu`.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::Vision::V1::BatchAnnotateFilesResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::Vision::V1::BatchAnnotateFilesResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/vision/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::Vision::V1::BatchAnnotateFilesRequest.new
            #
            #   # Call the batch_annotate_files method.
            #   result = client.batch_annotate_files request
            #
            #   # The returned object is of type Google::Cloud::Vision::V1::BatchAnnotateFilesResponse.
            #   p result
            #
            def batch_annotate_files request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Vision::V1::BatchAnnotateFilesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.batch_annotate_files.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Vision::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              options.apply_defaults timeout:      @config.rpcs.batch_annotate_files.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.batch_annotate_files.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @image_annotator_stub.call_rpc :batch_annotate_files, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Run asynchronous image detection and annotation for a list of images.
            #
            # Progress and results can be retrieved through the
            # `google.longrunning.Operations` interface.
            # `Operation.metadata` contains `OperationMetadata` (metadata).
            # `Operation.response` contains `AsyncBatchAnnotateImagesResponse` (results).
            #
            # This service will write image annotation outputs to json files in customer
            # GCS bucket, each json file containing BatchAnnotateImagesResponse proto.
            #
            # @overload async_batch_annotate_images(request, options = nil)
            #   Pass arguments to `async_batch_annotate_images` via a request object, either of type
            #   {::Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload async_batch_annotate_images(requests: nil, output_config: nil, parent: nil)
            #   Pass arguments to `async_batch_annotate_images` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param requests [::Array<::Google::Cloud::Vision::V1::AnnotateImageRequest, ::Hash>]
            #     Required. Individual image annotation requests for this batch.
            #   @param output_config [::Google::Cloud::Vision::V1::OutputConfig, ::Hash]
            #     Required. The desired output location and metadata (e.g. format).
            #   @param parent [::String]
            #     Optional. Target project and location to make a call.
            #
            #     Format: `projects/{project-id}/locations/{location-id}`.
            #
            #     If no parent is specified, a region will be chosen automatically.
            #
            #     Supported location-ids:
            #         `us`: USA country only,
            #         `asia`: East asia areas, like Japan, Taiwan,
            #         `eu`: The European Union.
            #
            #     Example: `projects/project-A/locations/eu`.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Gapic::Operation]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Gapic::Operation]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/vision/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest.new
            #
            #   # Call the async_batch_annotate_images method.
            #   result = client.async_batch_annotate_images request
            #
            #   # The returned object is of type Gapic::Operation. You can use this
            #   # object to check the status of an operation, cancel it, or wait
            #   # for results. Here is how to block until completion:
            #   result.wait_until_done! timeout: 60
            #   if result.response?
            #     p result.response
            #   else
            #     puts "Error!"
            #   end
            #
            def async_batch_annotate_images request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.async_batch_annotate_images.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Vision::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              options.apply_defaults timeout:      @config.rpcs.async_batch_annotate_images.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.async_batch_annotate_images.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @image_annotator_stub.call_rpc :async_batch_annotate_images, request, options: options do |response, operation|
                response = ::Gapic::Operation.new response, @operations_client, options: options
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Run asynchronous image detection and annotation for a list of generic
            # files, such as PDF files, which may contain multiple pages and multiple
            # images per page. Progress and results can be retrieved through the
            # `google.longrunning.Operations` interface.
            # `Operation.metadata` contains `OperationMetadata` (metadata).
            # `Operation.response` contains `AsyncBatchAnnotateFilesResponse` (results).
            #
            # @overload async_batch_annotate_files(request, options = nil)
            #   Pass arguments to `async_batch_annotate_files` via a request object, either of type
            #   {::Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload async_batch_annotate_files(requests: nil, parent: nil)
            #   Pass arguments to `async_batch_annotate_files` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param requests [::Array<::Google::Cloud::Vision::V1::AsyncAnnotateFileRequest, ::Hash>]
            #     Required. Individual async file annotation requests for this batch.
            #   @param parent [::String]
            #     Optional. Target project and location to make a call.
            #
            #     Format: `projects/{project-id}/locations/{location-id}`.
            #
            #     If no parent is specified, a region will be chosen automatically.
            #
            #     Supported location-ids:
            #         `us`: USA country only,
            #         `asia`: East asia areas, like Japan, Taiwan,
            #         `eu`: The European Union.
            #
            #     Example: `projects/project-A/locations/eu`.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Gapic::Operation]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Gapic::Operation]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/vision/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest.new
            #
            #   # Call the async_batch_annotate_files method.
            #   result = client.async_batch_annotate_files request
            #
            #   # The returned object is of type Gapic::Operation. You can use this
            #   # object to check the status of an operation, cancel it, or wait
            #   # for results. Here is how to block until completion:
            #   result.wait_until_done! timeout: 60
            #   if result.response?
            #     p result.response
            #   else
            #     puts "Error!"
            #   end
            #
            def async_batch_annotate_files request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.async_batch_annotate_files.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Vision::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              options.apply_defaults timeout:      @config.rpcs.async_batch_annotate_files.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.async_batch_annotate_files.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @image_annotator_stub.call_rpc :async_batch_annotate_files, request, options: options do |response, operation|
                response = ::Gapic::Operation.new response, @operations_client, options: options
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the ImageAnnotator API.
            #
            # This class represents the configuration for ImageAnnotator,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Cloud::Vision::V1::ImageAnnotator::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # @example
            #
            #   # Modify the global config, setting the timeout for
            #   # batch_annotate_images to 20 seconds,
            #   # and all remaining timeouts to 10 seconds.
            #   ::Google::Cloud::Vision::V1::ImageAnnotator::Client.configure do |config|
            #     config.timeout = 10.0
            #     config.rpcs.batch_annotate_images.timeout = 20.0
            #   end
            #
            #   # Apply the above configuration only to a new client.
            #   client = ::Google::Cloud::Vision::V1::ImageAnnotator::Client.new do |config|
            #     config.timeout = 10.0
            #     config.rpcs.batch_annotate_images.timeout = 20.0
            #   end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"vision.googleapis.com"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
            #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] channel_args
            #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
            #   `GRPC::Core::Channel` object is provided as the credential.
            #   @return [::Hash]
            # @!attribute [rw] interceptors
            #   An array of interceptors that are run before calls are executed.
            #   @return [::Array<::GRPC::ClientInterceptor>]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional gRPC headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            # @!attribute [rw] retry_policy
            #   The retry policy. The value is a hash with the following keys:
            #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #       trigger a retry.
            #   @return [::Hash]
            # @!attribute [rw] quota_project
            #   A separate project against which to charge quota.
            #   @return [::String]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "vision.googleapis.com", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
              config_attr :interceptors,  nil, ::Array, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil
              config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
              config_attr :quota_project, nil, ::String, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the ImageAnnotator API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
              #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
              #     include the following keys:
              #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #         trigger a retry.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `batch_annotate_images`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :batch_annotate_images
                ##
                # RPC-specific configuration for `batch_annotate_files`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :batch_annotate_files
                ##
                # RPC-specific configuration for `async_batch_annotate_images`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :async_batch_annotate_images
                ##
                # RPC-specific configuration for `async_batch_annotate_files`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :async_batch_annotate_files

                # @private
                def initialize parent_rpcs = nil
                  batch_annotate_images_config = parent_rpcs.batch_annotate_images if parent_rpcs.respond_to? :batch_annotate_images
                  @batch_annotate_images = ::Gapic::Config::Method.new batch_annotate_images_config
                  batch_annotate_files_config = parent_rpcs.batch_annotate_files if parent_rpcs.respond_to? :batch_annotate_files
                  @batch_annotate_files = ::Gapic::Config::Method.new batch_annotate_files_config
                  async_batch_annotate_images_config = parent_rpcs.async_batch_annotate_images if parent_rpcs.respond_to? :async_batch_annotate_images
                  @async_batch_annotate_images = ::Gapic::Config::Method.new async_batch_annotate_images_config
                  async_batch_annotate_files_config = parent_rpcs.async_batch_annotate_files if parent_rpcs.respond_to? :async_batch_annotate_files
                  @async_batch_annotate_files = ::Gapic::Config::Method.new async_batch_annotate_files_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
