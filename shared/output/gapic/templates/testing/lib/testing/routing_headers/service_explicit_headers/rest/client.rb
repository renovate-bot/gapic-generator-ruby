# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "testing/routing_headers/routing_headers_pb"
require "testing/routing_headers/service_explicit_headers/rest/service_stub"
require "google/cloud/location/rest"

module Testing
  module RoutingHeaders
    module ServiceExplicitHeaders
      module Rest
        ##
        # REST client for the ServiceExplicitHeaders service.
        #
        class Client
          # @private
          DEFAULT_ENDPOINT_TEMPLATE = "routingheaders.example.com"

          # @private
          attr_reader :service_explicit_headers_stub

          ##
          # Configure the ServiceExplicitHeaders Client class.
          #
          # See {::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client::Configuration}
          # for a description of the configuration fields.
          #
          # @example
          #
          #   # Modify the configuration for all ServiceExplicitHeaders clients
          #   ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.configure do |config|
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
              default_config = Client::Configuration.new

              default_config
            end
            yield @configure if block_given?
            @configure
          end

          ##
          # Configure the ServiceExplicitHeaders Client instance.
          #
          # The configuration is set to the derived mode, meaning that values can be changed,
          # but structural changes (adding new fields, etc.) are not allowed. Structural changes
          # should be made on {Client.configure}.
          #
          # See {::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client::Configuration}
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
          # The effective universe domain
          #
          # @return [String]
          #
          def universe_domain
            @service_explicit_headers_stub.universe_domain
          end

          ##
          # Create a new ServiceExplicitHeaders REST client object.
          #
          # @example
          #
          #   # Create a client using the default configuration
          #   client = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a client using a custom configuration
          #   client = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new do |config|
          #     config.timeout = 10.0
          #   end
          #
          # @yield [config] Configure the ServiceExplicitHeaders client.
          # @yieldparam config [Client::Configuration]
          #
          def initialize
            # Create the configuration object
            @config = Configuration.new Client.configure

            # Yield the configuration if needed
            yield @config if block_given?

            # Create credentials
            credentials = @config.credentials
            # Use self-signed JWT if the endpoint is unchanged from default,
            # but only if the default endpoint does not have a region prefix.
            enable_self_signed_jwt = @config.endpoint.nil? ||
                                     (@config.endpoint == Configuration::DEFAULT_ENDPOINT &&
                                     !@config.endpoint.split(".").first.include?("-"))
            credentials ||= Credentials.default scope: @config.scope,
                                                enable_self_signed_jwt: enable_self_signed_jwt
            if credentials.is_a?(::String) || credentials.is_a?(::Hash)
              credentials = Credentials.new credentials, scope: @config.scope
            end

            @quota_project_id = @config.quota_project
            @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

            @location_client = Google::Cloud::Location::Locations::Rest::Client.new do |config|
              config.credentials = credentials
              config.quota_project = @quota_project_id
              config.endpoint = @config.endpoint
              config.universe_domain = @config.universe_domain
              config.bindings_override = @config.bindings_override
            end

            @service_explicit_headers_stub = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::ServiceStub.new(
              endpoint: @config.endpoint,
              endpoint_template: DEFAULT_ENDPOINT_TEMPLATE,
              universe_domain: @config.universe_domain,
              credentials: credentials
            )
          end

          ##
          # Get the associated client for mix-in of the Locations.
          #
          # @return [Google::Cloud::Location::Locations::Rest::Client]
          #
          attr_reader :location_client

          # Service calls

          ##
          # @overload plain_no_template(request, options = nil)
          #   Pass arguments to `plain_no_template` via a request object, either of type
          #   {::Testing::RoutingHeaders::Request} or an equivalent Hash.
          #
          #   @param request [::Testing::RoutingHeaders::Request, ::Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [::Gapic::CallOptions, ::Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
          #
          # @overload plain_no_template(table_name: nil, app_profile_id: nil, resource: nil)
          #   Pass arguments to `plain_no_template` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param table_name [::String]
          #     The name of the Table
          #     Values can be of the following formats:
          #     - `projects/<project>/tables/<table>`
          #     - `projects/<project>/instances/<instance>/tables/<table>`
          #     - `region/<region>/zones/<zone>/tables/<table>`
          #   @param app_profile_id [::String]
          #     This value specifies routing for replication.
          #     It can be in the following formats:
          #     - profiles/<profile_id>
          #     - a legacy profile_id that can be any string
          #   @param resource [::Testing::RoutingHeaders::RequestResource, ::Hash]
          # @yield [result, operation] Access the result along with the TransportOperation object
          # @yieldparam result [::Testing::RoutingHeaders::Response]
          # @yieldparam operation [::Gapic::Rest::TransportOperation]
          #
          # @return [::Testing::RoutingHeaders::Response]
          #
          # @raise [::Gapic::Rest::Error] if the REST call is aborted.
          #
          # @example Basic example
          #   require "testing/routing_headers"
          #
          #   # Create a client object. The client can be reused for multiple calls.
          #   client = Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a request. To set request fields, pass in keyword arguments.
          #   request = Testing::RoutingHeaders::Request.new
          #
          #   # Call the plain_no_template method.
          #   result = client.plain_no_template request
          #
          #   # The returned object is of type Testing::RoutingHeaders::Response.
          #   p result
          #
          def plain_no_template request, options = nil
            raise ::ArgumentError, "request must be provided" if request.nil?

            request = ::Gapic::Protobuf.coerce request, to: ::Testing::RoutingHeaders::Request

            # Converts hash and nil to an options object
            options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            call_metadata = @config.rpcs.plain_no_template.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Testing::VERSION,
              transports_version_send: [:rest]

            call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            options.apply_defaults timeout:      @config.rpcs.plain_no_template.timeout,
                                   metadata:     call_metadata,
                                   retry_policy: @config.rpcs.plain_no_template.retry_policy

            options.apply_defaults timeout:      @config.timeout,
                                   metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @service_explicit_headers_stub.plain_no_template request, options do |result, operation|
              yield result, operation if block_given?
              return result
            end
          rescue ::Faraday::Error => e
            raise ::Gapic::Rest::Error.wrap_faraday_error e
          end

          ##
          # @overload plain_full_field(request, options = nil)
          #   Pass arguments to `plain_full_field` via a request object, either of type
          #   {::Testing::RoutingHeaders::Request} or an equivalent Hash.
          #
          #   @param request [::Testing::RoutingHeaders::Request, ::Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [::Gapic::CallOptions, ::Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
          #
          # @overload plain_full_field(table_name: nil, app_profile_id: nil, resource: nil)
          #   Pass arguments to `plain_full_field` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param table_name [::String]
          #     The name of the Table
          #     Values can be of the following formats:
          #     - `projects/<project>/tables/<table>`
          #     - `projects/<project>/instances/<instance>/tables/<table>`
          #     - `region/<region>/zones/<zone>/tables/<table>`
          #   @param app_profile_id [::String]
          #     This value specifies routing for replication.
          #     It can be in the following formats:
          #     - profiles/<profile_id>
          #     - a legacy profile_id that can be any string
          #   @param resource [::Testing::RoutingHeaders::RequestResource, ::Hash]
          # @yield [result, operation] Access the result along with the TransportOperation object
          # @yieldparam result [::Testing::RoutingHeaders::Response]
          # @yieldparam operation [::Gapic::Rest::TransportOperation]
          #
          # @return [::Testing::RoutingHeaders::Response]
          #
          # @raise [::Gapic::Rest::Error] if the REST call is aborted.
          #
          # @example Basic example
          #   require "testing/routing_headers"
          #
          #   # Create a client object. The client can be reused for multiple calls.
          #   client = Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a request. To set request fields, pass in keyword arguments.
          #   request = Testing::RoutingHeaders::Request.new
          #
          #   # Call the plain_full_field method.
          #   result = client.plain_full_field request
          #
          #   # The returned object is of type Testing::RoutingHeaders::Response.
          #   p result
          #
          def plain_full_field request, options = nil
            raise ::ArgumentError, "request must be provided" if request.nil?

            request = ::Gapic::Protobuf.coerce request, to: ::Testing::RoutingHeaders::Request

            # Converts hash and nil to an options object
            options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            call_metadata = @config.rpcs.plain_full_field.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Testing::VERSION,
              transports_version_send: [:rest]

            call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            options.apply_defaults timeout:      @config.rpcs.plain_full_field.timeout,
                                   metadata:     call_metadata,
                                   retry_policy: @config.rpcs.plain_full_field.retry_policy

            options.apply_defaults timeout:      @config.timeout,
                                   metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @service_explicit_headers_stub.plain_full_field request, options do |result, operation|
              yield result, operation if block_given?
              return result
            end
          rescue ::Faraday::Error => e
            raise ::Gapic::Rest::Error.wrap_faraday_error e
          end

          ##
          # @overload plain_extract(request, options = nil)
          #   Pass arguments to `plain_extract` via a request object, either of type
          #   {::Testing::RoutingHeaders::Request} or an equivalent Hash.
          #
          #   @param request [::Testing::RoutingHeaders::Request, ::Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [::Gapic::CallOptions, ::Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
          #
          # @overload plain_extract(table_name: nil, app_profile_id: nil, resource: nil)
          #   Pass arguments to `plain_extract` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param table_name [::String]
          #     The name of the Table
          #     Values can be of the following formats:
          #     - `projects/<project>/tables/<table>`
          #     - `projects/<project>/instances/<instance>/tables/<table>`
          #     - `region/<region>/zones/<zone>/tables/<table>`
          #   @param app_profile_id [::String]
          #     This value specifies routing for replication.
          #     It can be in the following formats:
          #     - profiles/<profile_id>
          #     - a legacy profile_id that can be any string
          #   @param resource [::Testing::RoutingHeaders::RequestResource, ::Hash]
          # @yield [result, operation] Access the result along with the TransportOperation object
          # @yieldparam result [::Testing::RoutingHeaders::Response]
          # @yieldparam operation [::Gapic::Rest::TransportOperation]
          #
          # @return [::Testing::RoutingHeaders::Response]
          #
          # @raise [::Gapic::Rest::Error] if the REST call is aborted.
          #
          # @example Basic example
          #   require "testing/routing_headers"
          #
          #   # Create a client object. The client can be reused for multiple calls.
          #   client = Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a request. To set request fields, pass in keyword arguments.
          #   request = Testing::RoutingHeaders::Request.new
          #
          #   # Call the plain_extract method.
          #   result = client.plain_extract request
          #
          #   # The returned object is of type Testing::RoutingHeaders::Response.
          #   p result
          #
          def plain_extract request, options = nil
            raise ::ArgumentError, "request must be provided" if request.nil?

            request = ::Gapic::Protobuf.coerce request, to: ::Testing::RoutingHeaders::Request

            # Converts hash and nil to an options object
            options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            call_metadata = @config.rpcs.plain_extract.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Testing::VERSION,
              transports_version_send: [:rest]

            call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            options.apply_defaults timeout:      @config.rpcs.plain_extract.timeout,
                                   metadata:     call_metadata,
                                   retry_policy: @config.rpcs.plain_extract.retry_policy

            options.apply_defaults timeout:      @config.timeout,
                                   metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @service_explicit_headers_stub.plain_extract request, options do |result, operation|
              yield result, operation if block_given?
              return result
            end
          rescue ::Faraday::Error => e
            raise ::Gapic::Rest::Error.wrap_faraday_error e
          end

          ##
          # @overload complex(request, options = nil)
          #   Pass arguments to `complex` via a request object, either of type
          #   {::Testing::RoutingHeaders::Request} or an equivalent Hash.
          #
          #   @param request [::Testing::RoutingHeaders::Request, ::Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [::Gapic::CallOptions, ::Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
          #
          # @overload complex(table_name: nil, app_profile_id: nil, resource: nil)
          #   Pass arguments to `complex` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param table_name [::String]
          #     The name of the Table
          #     Values can be of the following formats:
          #     - `projects/<project>/tables/<table>`
          #     - `projects/<project>/instances/<instance>/tables/<table>`
          #     - `region/<region>/zones/<zone>/tables/<table>`
          #   @param app_profile_id [::String]
          #     This value specifies routing for replication.
          #     It can be in the following formats:
          #     - profiles/<profile_id>
          #     - a legacy profile_id that can be any string
          #   @param resource [::Testing::RoutingHeaders::RequestResource, ::Hash]
          # @yield [result, operation] Access the result along with the TransportOperation object
          # @yieldparam result [::Testing::RoutingHeaders::Response]
          # @yieldparam operation [::Gapic::Rest::TransportOperation]
          #
          # @return [::Testing::RoutingHeaders::Response]
          #
          # @raise [::Gapic::Rest::Error] if the REST call is aborted.
          #
          # @example Basic example
          #   require "testing/routing_headers"
          #
          #   # Create a client object. The client can be reused for multiple calls.
          #   client = Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a request. To set request fields, pass in keyword arguments.
          #   request = Testing::RoutingHeaders::Request.new
          #
          #   # Call the complex method.
          #   result = client.complex request
          #
          #   # The returned object is of type Testing::RoutingHeaders::Response.
          #   p result
          #
          def complex request, options = nil
            raise ::ArgumentError, "request must be provided" if request.nil?

            request = ::Gapic::Protobuf.coerce request, to: ::Testing::RoutingHeaders::Request

            # Converts hash and nil to an options object
            options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            call_metadata = @config.rpcs.complex.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Testing::VERSION,
              transports_version_send: [:rest]

            call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            options.apply_defaults timeout:      @config.rpcs.complex.timeout,
                                   metadata:     call_metadata,
                                   retry_policy: @config.rpcs.complex.retry_policy

            options.apply_defaults timeout:      @config.timeout,
                                   metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @service_explicit_headers_stub.complex request, options do |result, operation|
              yield result, operation if block_given?
              return result
            end
          rescue ::Faraday::Error => e
            raise ::Gapic::Rest::Error.wrap_faraday_error e
          end

          ##
          # @overload with_sub_message(request, options = nil)
          #   Pass arguments to `with_sub_message` via a request object, either of type
          #   {::Testing::RoutingHeaders::Request} or an equivalent Hash.
          #
          #   @param request [::Testing::RoutingHeaders::Request, ::Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [::Gapic::CallOptions, ::Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
          #
          # @overload with_sub_message(table_name: nil, app_profile_id: nil, resource: nil)
          #   Pass arguments to `with_sub_message` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param table_name [::String]
          #     The name of the Table
          #     Values can be of the following formats:
          #     - `projects/<project>/tables/<table>`
          #     - `projects/<project>/instances/<instance>/tables/<table>`
          #     - `region/<region>/zones/<zone>/tables/<table>`
          #   @param app_profile_id [::String]
          #     This value specifies routing for replication.
          #     It can be in the following formats:
          #     - profiles/<profile_id>
          #     - a legacy profile_id that can be any string
          #   @param resource [::Testing::RoutingHeaders::RequestResource, ::Hash]
          # @yield [result, operation] Access the result along with the TransportOperation object
          # @yieldparam result [::Testing::RoutingHeaders::Response]
          # @yieldparam operation [::Gapic::Rest::TransportOperation]
          #
          # @return [::Testing::RoutingHeaders::Response]
          #
          # @raise [::Gapic::Rest::Error] if the REST call is aborted.
          #
          # @example Basic example
          #   require "testing/routing_headers"
          #
          #   # Create a client object. The client can be reused for multiple calls.
          #   client = Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
          #
          #   # Create a request. To set request fields, pass in keyword arguments.
          #   request = Testing::RoutingHeaders::Request.new
          #
          #   # Call the with_sub_message method.
          #   result = client.with_sub_message request
          #
          #   # The returned object is of type Testing::RoutingHeaders::Response.
          #   p result
          #
          def with_sub_message request, options = nil
            raise ::ArgumentError, "request must be provided" if request.nil?

            request = ::Gapic::Protobuf.coerce request, to: ::Testing::RoutingHeaders::Request

            # Converts hash and nil to an options object
            options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            call_metadata = @config.rpcs.with_sub_message.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Testing::VERSION,
              transports_version_send: [:rest]

            call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            options.apply_defaults timeout:      @config.rpcs.with_sub_message.timeout,
                                   metadata:     call_metadata,
                                   retry_policy: @config.rpcs.with_sub_message.retry_policy

            options.apply_defaults timeout:      @config.timeout,
                                   metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @service_explicit_headers_stub.with_sub_message request, options do |result, operation|
              yield result, operation if block_given?
              return result
            end
          rescue ::Faraday::Error => e
            raise ::Gapic::Rest::Error.wrap_faraday_error e
          end

          ##
          # Configuration class for the ServiceExplicitHeaders REST API.
          #
          # This class represents the configuration for ServiceExplicitHeaders REST,
          # providing control over timeouts, retry behavior, logging, transport
          # parameters, and other low-level controls. Certain parameters can also be
          # applied individually to specific RPCs. See
          # {::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client::Configuration::Rpcs}
          # for a list of RPCs that can be configured independently.
          #
          # Configuration can be applied globally to all clients, or to a single client
          # on construction.
          #
          # @example
          #
          #   # Modify the global config, setting the timeout for
          #   # plain_no_template to 20 seconds,
          #   # and all remaining timeouts to 10 seconds.
          #   ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.configure do |config|
          #     config.timeout = 10.0
          #     config.rpcs.plain_no_template.timeout = 20.0
          #   end
          #
          #   # Apply the above configuration only to a new client.
          #   client = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new do |config|
          #     config.timeout = 10.0
          #     config.rpcs.plain_no_template.timeout = 20.0
          #   end
          #
          # @!attribute [rw] endpoint
          #   A custom service endpoint, as a hostname or hostname:port. The default is
          #   nil, indicating to use the default endpoint in the current universe domain.
          #   @return [::String,nil]
          # @!attribute [rw] credentials
          #   Credentials to send with calls. You may provide any of the following types:
          #    *  (`String`) The path to a service account key file in JSON format
          #    *  (`Hash`) A service account key as a Hash
          #    *  (`Google::Auth::Credentials`) A googleauth credentials object
          #       (see the [googleauth docs](https://rubydoc.info/gems/googleauth/Google/Auth/Credentials))
          #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
          #       (see the [signet docs](https://rubydoc.info/gems/signet/Signet/OAuth2/Client))
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
          # @!attribute [rw] timeout
          #   The call timeout in seconds.
          #   @return [::Numeric]
          # @!attribute [rw] metadata
          #   Additional headers to be sent with the call.
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
          # @!attribute [rw] universe_domain
          #   The universe domain within which to make requests. This determines the
          #   default endpoint URL. The default value of nil uses the environment
          #   universe (usually the default "googleapis.com" universe).
          #   @return [::String,nil]
          #
          class Configuration
            extend ::Gapic::Config

            # @private
            # The endpoint specific to the default "googleapis.com" universe. Deprecated.
            DEFAULT_ENDPOINT = "routingheaders.example.com"

            config_attr :endpoint,      nil, ::String, nil
            config_attr :credentials,   nil do |value|
              allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
              allowed.any? { |klass| klass === value }
            end
            config_attr :scope,         nil, ::String, ::Array, nil
            config_attr :lib_name,      nil, ::String, nil
            config_attr :lib_version,   nil, ::String, nil
            config_attr :timeout,       nil, ::Numeric, nil
            config_attr :metadata,      nil, ::Hash, nil
            config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
            config_attr :quota_project, nil, ::String, nil
            config_attr :universe_domain, nil, ::String, nil

            # @private
            # Overrides for http bindings for the RPCs of this service
            # are only used when this service is used as mixin, and only
            # by the host service.
            # @return [::Hash{::Symbol=>::Array<::Gapic::Rest::GrpcTranscoder::HttpBinding>}]
            config_attr :bindings_override, {}, ::Hash, nil

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
            # Configuration RPC class for the ServiceExplicitHeaders API.
            #
            # Includes fields providing the configuration for each RPC in this service.
            # Each configuration object is of type `Gapic::Config::Method` and includes
            # the following configuration fields:
            #
            #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
            #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional headers
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
              # RPC-specific configuration for `plain_no_template`
              # @return [::Gapic::Config::Method]
              #
              attr_reader :plain_no_template
              ##
              # RPC-specific configuration for `plain_full_field`
              # @return [::Gapic::Config::Method]
              #
              attr_reader :plain_full_field
              ##
              # RPC-specific configuration for `plain_extract`
              # @return [::Gapic::Config::Method]
              #
              attr_reader :plain_extract
              ##
              # RPC-specific configuration for `complex`
              # @return [::Gapic::Config::Method]
              #
              attr_reader :complex
              ##
              # RPC-specific configuration for `with_sub_message`
              # @return [::Gapic::Config::Method]
              #
              attr_reader :with_sub_message

              # @private
              def initialize parent_rpcs = nil
                plain_no_template_config = parent_rpcs.plain_no_template if parent_rpcs.respond_to? :plain_no_template
                @plain_no_template = ::Gapic::Config::Method.new plain_no_template_config
                plain_full_field_config = parent_rpcs.plain_full_field if parent_rpcs.respond_to? :plain_full_field
                @plain_full_field = ::Gapic::Config::Method.new plain_full_field_config
                plain_extract_config = parent_rpcs.plain_extract if parent_rpcs.respond_to? :plain_extract
                @plain_extract = ::Gapic::Config::Method.new plain_extract_config
                complex_config = parent_rpcs.complex if parent_rpcs.respond_to? :complex
                @complex = ::Gapic::Config::Method.new complex_config
                with_sub_message_config = parent_rpcs.with_sub_message if parent_rpcs.respond_to? :with_sub_message
                @with_sub_message = ::Gapic::Config::Method.new with_sub_message_config

                yield self if block_given?
              end
            end
          end
        end
      end
    end
  end
end
