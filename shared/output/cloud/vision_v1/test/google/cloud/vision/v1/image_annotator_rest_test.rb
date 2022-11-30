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

require "helper"
require "gapic/rest"
require "google/cloud/vision/v1/image_annotator_pb"
require "google/cloud/vision/v1/image_annotator/rest"


class ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_count, :requests

    def initialize response, &block
      @response = response
      @block = block
      @call_count = 0
      @requests = []
    end

    def make_get_request uri:, params: {}, options: {}
      make_http_request :get, uri: uri, body: nil, params: params, options: options
    end

    def make_delete_request uri:, params: {}, options: {}
      make_http_request :delete, uri: uri, body: nil, params: params, options: options
    end

    def make_post_request uri:, body: nil, params: {}, options: {}
      make_http_request :post, uri: uri, body: body, params: params, options: options
    end

    def make_patch_request uri:, body:, params: {}, options: {}
      make_http_request :patch, uri: uri, body: body, params: params, options: options
    end

    def make_put_request uri:, body:, params: {}, options: {}
      make_http_request :put, uri: uri, body: body, params: params, options: options
    end

    def make_http_request *args, **kwargs
      @call_count += 1

      @requests << @block&.call(*args, **kwargs)

      @response
    end
  end

  def test_batch_annotate_images
    # Create test objects.
    client_result = ::Google::Cloud::Vision::V1::BatchAnnotateImagesResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    requests = [{}]
    parent = "hello world"

    batch_annotate_images_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::ServiceStub.stub :transcode_batch_annotate_images_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, batch_annotate_images_client_stub do
        # Create client
        client = ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.batch_annotate_images({ requests: requests, parent: parent }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.batch_annotate_images requests: requests, parent: parent do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.batch_annotate_images ::Google::Cloud::Vision::V1::BatchAnnotateImagesRequest.new(requests: requests, parent: parent) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.batch_annotate_images({ requests: requests, parent: parent }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.batch_annotate_images(::Google::Cloud::Vision::V1::BatchAnnotateImagesRequest.new(requests: requests, parent: parent), call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, batch_annotate_images_client_stub.call_count
      end
    end
  end

  def test_batch_annotate_files
    # Create test objects.
    client_result = ::Google::Cloud::Vision::V1::BatchAnnotateFilesResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    requests = [{}]
    parent = "hello world"

    batch_annotate_files_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::ServiceStub.stub :transcode_batch_annotate_files_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, batch_annotate_files_client_stub do
        # Create client
        client = ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.batch_annotate_files({ requests: requests, parent: parent }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.batch_annotate_files requests: requests, parent: parent do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.batch_annotate_files ::Google::Cloud::Vision::V1::BatchAnnotateFilesRequest.new(requests: requests, parent: parent) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.batch_annotate_files({ requests: requests, parent: parent }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.batch_annotate_files(::Google::Cloud::Vision::V1::BatchAnnotateFilesRequest.new(requests: requests, parent: parent), call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, batch_annotate_files_client_stub.call_count
      end
    end
  end

  def test_async_batch_annotate_images
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    requests = [{}]
    output_config = {}
    parent = "hello world"

    async_batch_annotate_images_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::ServiceStub.stub :transcode_async_batch_annotate_images_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, async_batch_annotate_images_client_stub do
        # Create client
        client = ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.async_batch_annotate_images({ requests: requests, output_config: output_config, parent: parent }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.async_batch_annotate_images requests: requests, output_config: output_config, parent: parent do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.async_batch_annotate_images ::Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest.new(requests: requests, output_config: output_config, parent: parent) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.async_batch_annotate_images({ requests: requests, output_config: output_config, parent: parent }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.async_batch_annotate_images(::Google::Cloud::Vision::V1::AsyncBatchAnnotateImagesRequest.new(requests: requests, output_config: output_config, parent: parent), call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, async_batch_annotate_images_client_stub.call_count
      end
    end
  end

  def test_async_batch_annotate_files
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    requests = [{}]
    parent = "hello world"

    async_batch_annotate_files_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::ServiceStub.stub :transcode_async_batch_annotate_files_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, async_batch_annotate_files_client_stub do
        # Create client
        client = ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.async_batch_annotate_files({ requests: requests, parent: parent }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.async_batch_annotate_files requests: requests, parent: parent do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.async_batch_annotate_files ::Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest.new(requests: requests, parent: parent) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.async_batch_annotate_files({ requests: requests, parent: parent }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.async_batch_annotate_files(::Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest.new(requests: requests, parent: parent), call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, async_batch_annotate_files_client_stub.call_count
      end
    end
  end

  def test_configure
    credentials_token = :dummy_value

    client = block_config = config = nil
    Gapic::Rest::ClientStub.stub :new, nil do
      client = ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client.new do |config|
        config.credentials = credentials_token
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Vision::V1::ImageAnnotator::Rest::Client::Configuration, config
  end
end
