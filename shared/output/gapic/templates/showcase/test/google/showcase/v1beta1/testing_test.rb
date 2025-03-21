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

require "helper"

require "gapic/grpc/service_stub"

require "google/showcase/v1beta1/testing_pb"
require "google/showcase/v1beta1/testing_services_pb"
require "google/showcase/v1beta1/testing"

class ::Google::Showcase::V1beta1::Testing::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args, **kwargs
      @call_rpc_count += 1

      @requests << @block&.call(*args, **kwargs)

      catch :response do
        yield @response, @operation if block_given?
        @response
      end
    end

    def endpoint
      "endpoint.example.com"
    end

    def universe_domain
      "example.com"
    end

    def stub_logger
      nil
    end

    def logger
      nil
    end
  end

  def test_create_session
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::Session.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    session = {}

    create_session_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_session, name
      assert_kind_of ::Google::Showcase::V1beta1::CreateSessionRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Showcase::V1beta1::Session), request["session"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_session_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_session({ session: session }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_session session: session do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_session ::Google::Showcase::V1beta1::CreateSessionRequest.new(session: session) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_session({ session: session }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_session(::Google::Showcase::V1beta1::CreateSessionRequest.new(session: session), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_session_client_stub.call_rpc_count
    end
  end

  def test_get_session
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::Session.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_session_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_session, name
      assert_kind_of ::Google::Showcase::V1beta1::GetSessionRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_session_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_session({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_session name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_session ::Google::Showcase::V1beta1::GetSessionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_session({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_session(::Google::Showcase::V1beta1::GetSessionRequest.new(name: name), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_session_client_stub.call_rpc_count
    end
  end

  def test_list_sessions
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::ListSessionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    page_size = 42
    page_token = "hello world"

    list_sessions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_sessions, name
      assert_kind_of ::Google::Showcase::V1beta1::ListSessionsRequest, request
      assert_equal 42, request["page_size"]
      assert_equal "hello world", request["page_token"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_sessions_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_sessions({ page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_sessions page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_sessions ::Google::Showcase::V1beta1::ListSessionsRequest.new(page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_sessions({ page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_sessions(::Google::Showcase::V1beta1::ListSessionsRequest.new(page_size: page_size, page_token: page_token), grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_sessions_client_stub.call_rpc_count
    end
  end

  def test_delete_session
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_session_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_session, name
      assert_kind_of ::Google::Showcase::V1beta1::DeleteSessionRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_session_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_session({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_session name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_session ::Google::Showcase::V1beta1::DeleteSessionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_session({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_session(::Google::Showcase::V1beta1::DeleteSessionRequest.new(name: name), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_session_client_stub.call_rpc_count
    end
  end

  def test_report_session
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::ReportSessionResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    report_session_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :report_session, name
      assert_kind_of ::Google::Showcase::V1beta1::ReportSessionRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, report_session_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.report_session({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.report_session name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.report_session ::Google::Showcase::V1beta1::ReportSessionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.report_session({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.report_session(::Google::Showcase::V1beta1::ReportSessionRequest.new(name: name), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, report_session_client_stub.call_rpc_count
    end
  end

  def test_list_tests
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::ListTestsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_tests_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_tests, name
      assert_kind_of ::Google::Showcase::V1beta1::ListTestsRequest, request
      assert_equal "hello world", request["parent"]
      assert_equal 42, request["page_size"]
      assert_equal "hello world", request["page_token"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_tests_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_tests({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_tests parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_tests ::Google::Showcase::V1beta1::ListTestsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_tests({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_tests(::Google::Showcase::V1beta1::ListTestsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_tests_client_stub.call_rpc_count
    end
  end

  def test_delete_test
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_test_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_test, name
      assert_kind_of ::Google::Showcase::V1beta1::DeleteTestRequest, request
      assert_equal "hello world", request["name"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_test_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_test({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_test name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_test ::Google::Showcase::V1beta1::DeleteTestRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_test({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_test(::Google::Showcase::V1beta1::DeleteTestRequest.new(name: name), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_test_client_stub.call_rpc_count
    end
  end

  def test_verify_test
    # Create GRPC objects.
    grpc_response = ::Google::Showcase::V1beta1::VerifyTestResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    answer = "hello world"
    answers = ["hello world"]

    verify_test_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :verify_test, name
      assert_kind_of ::Google::Showcase::V1beta1::VerifyTestRequest, request
      assert_equal "hello world", request["name"]
      assert_equal "hello world", request["answer"]
      assert_equal ["hello world"], request["answers"]
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, verify_test_client_stub do
      # Create client
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.verify_test({ name: name, answer: answer, answers: answers }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.verify_test name: name, answer: answer, answers: answers do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.verify_test ::Google::Showcase::V1beta1::VerifyTestRequest.new(name: name, answer: answer, answers: answers) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.verify_test({ name: name, answer: answer, answers: answers }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.verify_test(::Google::Showcase::V1beta1::VerifyTestRequest.new(name: name, answer: answer, answers: answers), grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, verify_test_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    dummy_stub = ClientStub.new nil, nil
    Gapic::ServiceStub.stub :new, dummy_stub do
      client = ::Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Showcase::V1beta1::Testing::Client::Configuration, config
  end
end
