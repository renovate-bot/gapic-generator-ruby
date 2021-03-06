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

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/showcase/v1beta1/echo_pb"
require "google/showcase/v1beta1/echo_services_pb"
require "google/showcase/v1beta1/echo"

class Google::Showcase::V1beta1::Echo::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_echo
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::EchoResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    content = "hello world"

    echo_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :echo, name
      assert_kind_of Google::Showcase::V1beta1::EchoRequest, request
      assert_equal "hello world", request.content
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, echo_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.echo({ content: content }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.echo content: content do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.echo Google::Showcase::V1beta1::EchoRequest.new(content: content) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.echo({ content: content }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.echo Google::Showcase::V1beta1::EchoRequest.new(content: content), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, echo_client_stub.call_rpc_count
    end
  end

  def test_expand
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::EchoResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a server streaming method.
    content = "hello world"
    error = {}

    expand_client_stub = ClientStub.new [grpc_response].to_enum, grpc_operation do |name, request, options:|
      assert_equal :expand, name
      assert_kind_of Google::Showcase::V1beta1::ExpandRequest, request
      assert_equal "hello world", request.content
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Rpc::Status), request.error
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, expand_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.expand({ content: content, error: error }) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.expand content: content, error: error do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.expand Google::Showcase::V1beta1::ExpandRequest.new(content: content, error: error) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.expand({ content: content, error: error }, grpc_options) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.expand Google::Showcase::V1beta1::ExpandRequest.new(content: content, error: error), grpc_options do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, expand_client_stub.call_rpc_count
    end
  end

  def test_collect
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::EchoResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a client streaming method.
    content = "hello world"

    collect_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :collect, name
      assert_kind_of Enumerable, request
      refute_nil options
      request
    end

    Gapic::ServiceStub.stub :new, collect_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use enumerable object with hash and protobuf object.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      enum_input = [request_hash, request_proto].to_enum
      client.collect enum_input do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use stream input object (from gapic-common).
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      stream_input = Gapic::StreamInput.new
      client.collect stream_input do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end
      stream_input << request_hash
      stream_input << request_proto
      stream_input.close

      # Use enumerable object with hash and protobuf object with options.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      enum_input = [request_hash, request_proto].to_enum
      client.collect enum_input, grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use stream input object (from gapic-common) with options.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      stream_input = Gapic::StreamInput.new
      client.collect stream_input, grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end
      stream_input << request_hash
      stream_input << request_proto
      stream_input.close

      # Verify method calls
      assert_equal 4, collect_client_stub.call_rpc_count
      collect_client_stub.requests.each do |request|
        request.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoRequest, r
          assert_equal "hello world", r.content
        end
      end
    end
  end

  def test_chat
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::EchoResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a bidi streaming method.
    content = "hello world"

    chat_client_stub = ClientStub.new [grpc_response].to_enum, grpc_operation do |name, request, options:|
      assert_equal :chat, name
      assert_kind_of Enumerable, request
      refute_nil options
      request
    end

    Gapic::ServiceStub.stub :new, chat_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use enumerable object with hash and protobuf object.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      enum_input = [request_hash, request_proto].to_enum
      client.chat enum_input do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use stream input object (from gapic-common).
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      stream_input = Gapic::StreamInput.new
      client.chat stream_input do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end
      stream_input << request_hash
      stream_input << request_proto
      stream_input.close

      # Use enumerable object with hash and protobuf object with options.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      enum_input = [request_hash, request_proto].to_enum
      client.chat enum_input, grpc_options do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use stream input object (from gapic-common) with options.
      request_hash = { content: content }
      request_proto = Google::Showcase::V1beta1::EchoRequest.new content: content
      stream_input = Gapic::StreamInput.new
      client.chat stream_input, grpc_options do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoResponse, r
        end
        assert_equal grpc_operation, operation
      end
      stream_input << request_hash
      stream_input << request_proto
      stream_input.close

      # Verify method calls
      assert_equal 4, chat_client_stub.call_rpc_count
      chat_client_stub.requests.each do |request|
        request.to_a.each do |r|
          assert_kind_of Google::Showcase::V1beta1::EchoRequest, r
          assert_equal "hello world", r.content
        end
      end
    end
  end

  def test_paged_expand
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::PagedExpandResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    content = "hello world"
    page_size = 42
    page_token = "hello world"

    paged_expand_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :paged_expand, name
      assert_kind_of Google::Showcase::V1beta1::PagedExpandRequest, request
      assert_equal "hello world", request.content
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, paged_expand_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.paged_expand({ content: content, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.paged_expand content: content, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.paged_expand Google::Showcase::V1beta1::PagedExpandRequest.new(content: content, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.paged_expand({ content: content, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.paged_expand Google::Showcase::V1beta1::PagedExpandRequest.new(content: content, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, paged_expand_client_stub.call_rpc_count
    end
  end

  def test_wait
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    end_time = {}
    error = {}

    wait_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :wait, name
      assert_kind_of Google::Showcase::V1beta1::WaitRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Timestamp), request.end_time
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Rpc::Status), request.error
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, wait_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.wait({ end_time: end_time, error: error }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.wait end_time: end_time, error: error do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.wait Google::Showcase::V1beta1::WaitRequest.new(end_time: end_time, error: error) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.wait({ end_time: end_time, error: error }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.wait Google::Showcase::V1beta1::WaitRequest.new(end_time: end_time, error: error), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, wait_client_stub.call_rpc_count
    end
  end

  def test_block
    # Create GRPC objects.
    grpc_response = Google::Showcase::V1beta1::BlockResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    response_delay = {}

    block_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :block, name
      assert_kind_of Google::Showcase::V1beta1::BlockRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Duration), request.response_delay
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, block_client_stub do
      # Create client
      client = Google::Showcase::V1beta1::Echo::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.block({ response_delay: response_delay }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.block response_delay: response_delay do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.block Google::Showcase::V1beta1::BlockRequest.new(response_delay: response_delay) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.block({ response_delay: response_delay }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.block Google::Showcase::V1beta1::BlockRequest.new(response_delay: response_delay), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, block_client_stub.call_rpc_count
    end
  end
end
