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

# Auto-generated by gapic-generator-ruby v0.0.1.dev.1. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/speech/version"
require "google/cloud/speech/v1/cloud_speech_pb"
require "google/cloud/speech/v1/speech/credentials"
require "google/cloud/speech/v1/speech/operations"


module Google
  module Cloud
    module Speech
      module V1
        module Speech
          # Service that implements Speech API.
          class Client
            # @private
            attr_reader :speech_stub

            ##
            # Configuration for the Speech Client API.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= Client::Configuration.new
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the Speech Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
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
            # Create a new Client client object.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/cloud/speech/v1/cloud_speech_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              credentials ||= Credentials.default scope: @config.scope
              if credentials.is_a?(String) || credentials.is_a?(Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end

              @operations_client = Operations.new do |config|
                config.credentials = credentials
              end

              @speech_stub = Gapic::ServiceStub.new(
                Google::Cloud::Speech::V1::Speech::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Performs synchronous speech recognition: receive results after all audio
            # has been sent and processed.
            #
            # @overload recognize(request, options = nil)
            #   @param request [Google::Cloud::Speech::V1::RecognizeRequest | Hash]
            #     Performs synchronous speech recognition: receive results after all audio
            #     has been sent and processed.
            #   @param options [Gapic::CallOptions, Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload recognize(config: nil, audio: nil)
            #   @param config [Google::Cloud::Speech::V1::RecognitionConfig | Hash]
            #     Required. Provides information to the recognizer that specifies how to
            #     process the request.
            #   @param audio [Google::Cloud::Speech::V1::RecognitionAudio | Hash]
            #     Required. The audio data to be recognized.
            #
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [Google::Cloud::Speech::V1::RecognizeResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            #
            # @return [Google::Cloud::Speech::V1::RecognizeResponse]
            #
            # @raise [GRPC::BadStatus] if the RPC is aborted.
            #
            # @example Transcribe a short audio file using synchronous speech recognition
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   local_file_path = File.read "resources/brooklyn_bridge.raw"
            #
            #   audio = {
            #     # Path to local audio file, e.g. /path/audio.wav
            #     content: local_file_path
            #   }
            #   config = {
            #     # The language of the supplied audio
            #     language_code: "en-US",
            #     # Sample rate in Hertz of the audio data sent
            #     sample_rate_hertz: 16000,
            #     # Encoding of audio data sent. This sample sets this explicitly.
            #     # This field is optional for FLAC and WAV audio formats.
            #     encoding: :LINEAR16
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe short audio file from Cloud Storage using synchronous speech recognition
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   storage_uri = "gs://cloud-samples-data/speech/brooklyn_bridge.raw"
            #
            #   audio = {
            #     # URI for audio file in Cloud Storage, e.g. gs://[BUCKET]/[FILE]
            #     uri: storage_uri
            #   }
            #   config = {
            #     # Sample rate in Hertz of the audio data sent
            #     sample_rate_hertz: 16000,
            #     # The language of the supplied audio
            #     language_code: "en-US",
            #     # Encoding of audio data sent. This sample sets this explicitly.
            #     # This field is optional for FLAC and WAV audio formats.
            #     encoding: :LINEAR16
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe a short audio file with multiple channels
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   local_file_path = File.read "resources/multi.wav"
            #
            #   audio = {
            #     # Path to local audio file, e.g. /path/audio.wav
            #     content: local_file_path
            #   }
            #   config = {
            #     # The number of channels in the input audio file (optional)
            #     audio_channel_count: 2,
            #     # When set to true, each audio channel will be recognized separately.
            #     # The recognition result will contain a channel_tag field to state which
            #     # channel that result belongs to
            #     enable_separate_recognition_per_channel: true,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # %s to recognize which audio channel this result is for
            #     # channel_tag
            #     puts "Channel tag: #{result.channel_tag}"
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe a short audio file from Cloud Storage with multiple channels
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   storage_uri = "gs://cloud-samples-data/speech/multi.wav"
            #
            #   audio = {
            #     # URI for audio file in Cloud Storage, e.g. gs://[BUCKET]/[FILE]
            #     uri: storage_uri
            #   }
            #   config = {
            #     # The number of channels in the input audio file (optional)
            #     audio_channel_count: 2,
            #     # When set to true, each audio channel will be recognized separately.
            #     # The recognition result will contain a channel_tag field to state which
            #     # channel that result belongs to
            #     enable_separate_recognition_per_channel: true,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # %s to recognize which audio channel this result is for
            #     # channel_tag
            #     puts "Channel tag: #{result.channel_tag}"
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe a short audio file using a specified transcription model
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   local_file_path = File.read "resources/hello.wav"
            #   model = "phone_call"
            #
            #   audio = {
            #     # Path to local audio file, e.g. /path/audio.wav
            #     content: local_file_path
            #   }
            #   config = {
            #     # The transcription model to use, e.g. video, phone_call, default
            #     # For a list of available transcription models, see:
            #     # https://cloud.google.com/speech-to-text/docs/transcription-model#transcription_models
            #     model: model,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe a short audio file from Cloud Storage using a specified transcription model

            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   storage_uri = "gs://cloud-samples-data/speech/hello.wav"
            #   model = "phone_call"
            #
            #   audio = {
            #     # URI for audio file in Cloud Storage, e.g. gs://[BUCKET]/[FILE]
            #     uri: storage_uri
            #   }
            #   config = {
            #     # The transcription model to use, e.g. video, phone_call, default
            #     # For a list of available transcription models, see:
            #     # https://cloud.google.com/speech-to-text/docs/transcription-model#transcription_models
            #     model: model,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe a short audio file using an enhanced model
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   local_file_path = File.read "resources/hello.wav"
            #
            #   audio = {
            #     # Path to local audio file, e.g. /path/audio.wav
            #     content: local_file_path
            #   }
            #   config = {
            #     # The enhanced model to use, e.g. phone_call
            #     # Currently phone_call is the only model available as an enhanced model.
            #     model: "phone_call",
            #     # Use an enhanced model for speech recognition (when set to true).
            #     # Project must be eligible for requesting enhanced models.
            #     # Enhanced speech models require that you opt-in to data logging.
            #     use_enhanced: true,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.recognize audio: audio, config: config
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            def recognize request, options = nil
              raise ArgumentError, "request must be provided" if request.nil?

              request = Gapic::Protobuf.coerce request, to: Google::Cloud::Speech::V1::RecognizeRequest

              # Converts hash and nil to an options object
              options = Gapic::CallOptions.new options.to_h if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.recognize.metadata.to_h

              # Set x-goog-api-client header
              metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: Google::Cloud::Speech::VERSION

              options.apply_defaults timeout:      @config.rpcs.recognize.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.recognize.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @speech_stub.call_rpc :recognize, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            end

            ##
            # Performs asynchronous speech recognition: receive results via the
            # google.longrunning.Operations interface. Returns either an
            # `Operation.error` or an `Operation.response` which contains
            # a `LongRunningRecognizeResponse` message.
            # For more information on asynchronous speech recognition, see the
            # [how-to](https://cloud.google.com/speech-to-text/docs/async-recognize).
            #
            # @overload long_running_recognize(request, options = nil)
            #   @param request [Google::Cloud::Speech::V1::LongRunningRecognizeRequest | Hash]
            #     Performs asynchronous speech recognition: receive results via the
            #     google.longrunning.Operations interface. Returns either an
            #     `Operation.error` or an `Operation.response` which contains
            #     a `LongRunningRecognizeResponse` message.
            #     For more information on asynchronous speech recognition, see the
            #     [how-to](https://cloud.google.com/speech-to-text/docs/async-recognize).
            #   @param options [Gapic::CallOptions, Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload long_running_recognize(config: nil, audio: nil)
            #   @param config [Google::Cloud::Speech::V1::RecognitionConfig | Hash]
            #     Required. Provides information to the recognizer that specifies how to
            #     process the request.
            #   @param audio [Google::Cloud::Speech::V1::RecognitionAudio | Hash]
            #     Required. The audio data to be recognized.
            #
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [Gapic::Operation]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            #
            # @return [Gapic::Operation]
            #
            # @raise [GRPC::BadStatus] if the RPC is aborted.
            #
            # @example Transcribe a long audio file using asynchronous speech recognition
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   local_file_path = File.read "resources/brooklyn_bridge.raw"
            #
            #   audio = {
            #     # Path to local audio file, e.g. /path/audio.wav
            #     content: local_file_path
            #   }
            #   config = {
            #     # The language of the supplied audio
            #     language_code: "en-US",
            #     # Sample rate in Hertz of the audio data sent
            #     sample_rate_hertz: 16000,
            #     # Encoding of audio data sent. This sample sets this explicitly.
            #     # This field is optional for FLAC and WAV audio formats.
            #     encoding: :LINEAR16
            #   }
            #
            #   response = client.long_running_recognize audio: audio, config: config
            #
            #   # Wait until the long running operation is done
            #   response.wait_until_done!
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Transcribe long audio file from Cloud Storage using asynchronous speech recognition
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   storage_uri = "gs://cloud-samples-data/speech/brooklyn_bridge.raw"
            #
            #   audio = {
            #     # URI for audio file in Cloud Storage, e.g. gs://[BUCKET]/[FILE]
            #     uri: storage_uri
            #   }
            #   config = {
            #     # Sample rate in Hertz of the audio data sent
            #     sample_rate_hertz: 16000,
            #     # The language of the supplied audio
            #     language_code: "en-US",
            #     # Encoding of audio data sent. This sample sets this explicitly.
            #     # This field is optional for FLAC and WAV audio formats.
            #     encoding: :LINEAR16
            #   }
            #
            #   response = client.long_running_recognize audio: audio, config: config
            #
            #   # Wait until the long running operation is done
            #   response.wait_until_done!
            #   response.results.each do |result|
            #     # First alternative is the most probable result
            #     alternative = result.alternatives[0]
            #     puts "Transcript: #{alternative.transcript}"
            #   end
            #
            # @example Print start and end time of each word spoken in audio file from Cloud Storage
            #   require "google/cloud/speech/v1/speech"
            #
            #   client = Google::Cloud::Speech::V1::Speech::Client.new
            #
            #   storage_uri = "gs://cloud-samples-data/speech/brooklyn_bridge.flac"
            #
            #   audio = {
            #     # URI for audio file in Cloud Storage, e.g. gs://[BUCKET]/[FILE]
            #     uri: storage_uri
            #   }
            #   config = {
            #     # When enabled, the first result returned by the API will include a list
            #     # of words and the start and end time offsets (timestamps) for those words.
            #     enable_word_time_offsets: true,
            #     # The language of the supplied audio
            #     language_code: "en-US"
            #   }
            #
            #   response = client.long_running_recognize audio: audio, config: config
            #
            #   # Wait until the long running operation is done
            #   response.wait_until_done!
            #
            #   # The first result includes start and end time word offsets
            #   result = response.results[0]
            #
            #   # First alternative is the most probable result
            #   alternative = result.alternatives[0]
            #   puts "Transcript: #{alternative.transcript}"
            #
            #   # Print the start and end time of each word
            #   alternative.words.each do |word|
            #     puts "Word: #{word.word}"
            #     puts "Start time: #{word.start_time.seconds} seconds #{word.start_time.nanos} nanos"
            #     puts "End time: #{word.end_time.seconds} seconds #{word.end_time.nanos} nanos"
            #   end
            #
            def long_running_recognize request, options = nil
              raise ArgumentError, "request must be provided" if request.nil?

              request = Gapic::Protobuf.coerce request, to: Google::Cloud::Speech::V1::LongRunningRecognizeRequest

              # Converts hash and nil to an options object
              options = Gapic::CallOptions.new options.to_h if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.long_running_recognize.metadata.to_h

              # Set x-goog-api-client header
              metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: Google::Cloud::Speech::VERSION

              options.apply_defaults timeout:      @config.rpcs.long_running_recognize.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.long_running_recognize.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @speech_stub.call_rpc :long_running_recognize, request, options: options do |response, operation|
                response = Gapic::Operation.new response, @operations_client
                yield response, operation if block_given?
                return response
              end
            end

            ##
            # Performs bidirectional streaming speech recognition: receive results while
            # sending audio. This method is only available via the gRPC API (not REST).
            #
            # @param request [Gapic::StreamInput, Enumerable<Google::Cloud::Speech::V1::StreamingRecognizeRequest | Hash>]
            #   An enumerable of {Google::Cloud::Speech::V1::StreamingRecognizeRequest} instances.
            # @param options [Gapic::CallOptions, Hash]
            #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [Enumerable<Google::Cloud::Speech::V1::StreamingRecognizeResponse>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            #
            # @return [Enumerable<Google::Cloud::Speech::V1::StreamingRecognizeResponse>]
            #
            # @raise [GRPC::BadStatus] if the RPC is aborted.
            #
            def streaming_recognize request, options = nil
              unless request.is_a? Enumerable
                if request.respond_to? :to_enum
                  request = request.to_enum
                else
                  raise ArgumentError, "request must be an Enumerable"
                end
              end

              request = request.lazy.map do |req|
                Gapic::Protobuf.coerce req, to: Google::Cloud::Speech::V1::StreamingRecognizeRequest
              end

              # Converts hash and nil to an options object
              options = Gapic::CallOptions.new options.to_h if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.streaming_recognize.metadata.to_h

              # Set x-goog-api-client header
              metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: Google::Cloud::Speech::VERSION

              options.apply_defaults timeout:      @config.rpcs.streaming_recognize.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.streaming_recognize.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @speech_stub.call_rpc :streaming_recognize, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            end

            class Configuration
              extend Gapic::Config

              config_attr :endpoint,     "speech.googleapis.com", String
              config_attr :credentials,  nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,        nil, String, Array, nil
              config_attr :lib_name,     nil, String, nil
              config_attr :lib_version,  nil, String, nil
              config_attr(:channel_args, { "grpc.service_config_disable_resolution"=>1 }, Hash, nil)
              config_attr :interceptors, nil, Array, nil
              config_attr :timeout,      nil, Numeric, nil
              config_attr :metadata,     nil, Hash, nil
              config_attr :retry_policy, nil, Hash, Proc, nil

              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if @parent_config&.respond_to? :rpcs
                  Rpcs.new parent_rpcs
                end
              end

              class Rpcs
                attr_reader :recognize
                attr_reader :long_running_recognize
                attr_reader :streaming_recognize

                def initialize parent_rpcs = nil
                  recognize_config = nil
                  recognize_config = parent_rpcs&.recognize if parent_rpcs&.respond_to? :recognize
                  @recognize = Gapic::Config::Method.new recognize_config
                  long_running_recognize_config = nil
                  long_running_recognize_config = parent_rpcs&.long_running_recognize if parent_rpcs&.respond_to? :long_running_recognize
                  @long_running_recognize = Gapic::Config::Method.new long_running_recognize_config
                  streaming_recognize_config = nil
                  streaming_recognize_config = parent_rpcs&.streaming_recognize if parent_rpcs&.respond_to? :streaming_recognize
                  @streaming_recognize = Gapic::Config::Method.new streaming_recognize_config

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

# rubocop:disable Lint/HandleExceptions

# Once client is loaded, load helpers.rb if it exists.
begin
  require "google/cloud/speech/v1/speech/helpers"
rescue LoadError
end

# rubocop:enable Lint/HandleExceptions