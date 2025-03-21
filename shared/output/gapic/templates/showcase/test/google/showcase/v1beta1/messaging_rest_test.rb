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
require "gapic/rest"
require "google/showcase/v1beta1/messaging_pb"
require "google/showcase/v1beta1/messaging/rest"


class ::Google::Showcase::V1beta1::Messaging::Rest::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_count, :requests

    def initialize response, &block
      @response = response
      @block = block
      @call_count = 0
      @requests = []
    end

    def make_get_request uri:, params: {}, options: {}, method_name: nil
      make_http_request :get, uri: uri, body: nil, params: params, options: options, method_name: method_name
    end

    def make_delete_request uri:, params: {}, options: {}, method_name: nil
      make_http_request :delete, uri: uri, body: nil, params: params, options: options, method_name: method_name
    end

    def make_post_request uri:, body: nil, params: {}, options: {}, method_name: nil
      make_http_request :post, uri: uri, body: body, params: params, options: options, method_name: method_name
    end

    def make_patch_request uri:, body:, params: {}, options: {}, method_name: nil
      make_http_request :patch, uri: uri, body: body, params: params, options: options, method_name: method_name
    end

    def make_put_request uri:, body:, params: {}, options: {}, method_name: nil
      make_http_request :put, uri: uri, body: body, params: params, options: options, method_name: method_name
    end

    def make_http_request *args, **kwargs
      @call_count += 1

      @requests << @block&.call(*args, **kwargs)

      @response
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

  def test_create_room
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Room.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    room = {}

    create_room_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_create_room_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, create_room_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.create_room({ room: room }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.create_room room: room do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.create_room ::Google::Showcase::V1beta1::CreateRoomRequest.new(room: room) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.create_room({ room: room }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.create_room(::Google::Showcase::V1beta1::CreateRoomRequest.new(room: room), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, create_room_client_stub.call_count
      end
    end
  end

  def test_get_room
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Room.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_room_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_get_room_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_room_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_room({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.get_room name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.get_room ::Google::Showcase::V1beta1::GetRoomRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.get_room({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.get_room(::Google::Showcase::V1beta1::GetRoomRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, get_room_client_stub.call_count
      end
    end
  end

  def test_update_room
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Room.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    room = {}
    update_mask = {}

    update_room_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_update_room_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, update_room_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.update_room({ room: room, update_mask: update_mask }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.update_room room: room, update_mask: update_mask do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.update_room ::Google::Showcase::V1beta1::UpdateRoomRequest.new(room: room, update_mask: update_mask) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.update_room({ room: room, update_mask: update_mask }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.update_room(::Google::Showcase::V1beta1::UpdateRoomRequest.new(room: room, update_mask: update_mask), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, update_room_client_stub.call_count
      end
    end
  end

  def test_delete_room
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_room_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_delete_room_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_room_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_room({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.delete_room name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.delete_room ::Google::Showcase::V1beta1::DeleteRoomRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.delete_room({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.delete_room(::Google::Showcase::V1beta1::DeleteRoomRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, delete_room_client_stub.call_count
      end
    end
  end

  def test_list_rooms
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::ListRoomsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    page_size = 42
    page_token = "hello world"

    list_rooms_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_list_rooms_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_rooms_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_rooms({ page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.list_rooms page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.list_rooms ::Google::Showcase::V1beta1::ListRoomsRequest.new(page_size: page_size, page_token: page_token) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.list_rooms({ page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.list_rooms(::Google::Showcase::V1beta1::ListRoomsRequest.new(page_size: page_size, page_token: page_token), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, list_rooms_client_stub.call_count
      end
    end
  end

  def test_create_blurb
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Blurb.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    blurb = {}

    create_blurb_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_create_blurb_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, create_blurb_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.create_blurb({ parent: parent, blurb: blurb }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.create_blurb parent: parent, blurb: blurb do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.create_blurb ::Google::Showcase::V1beta1::CreateBlurbRequest.new(parent: parent, blurb: blurb) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.create_blurb({ parent: parent, blurb: blurb }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.create_blurb(::Google::Showcase::V1beta1::CreateBlurbRequest.new(parent: parent, blurb: blurb), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, create_blurb_client_stub.call_count
      end
    end
  end

  def test_get_blurb
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Blurb.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_blurb_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_get_blurb_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_blurb_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_blurb({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.get_blurb name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.get_blurb ::Google::Showcase::V1beta1::GetBlurbRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.get_blurb({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.get_blurb(::Google::Showcase::V1beta1::GetBlurbRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, get_blurb_client_stub.call_count
      end
    end
  end

  def test_update_blurb
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Blurb.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    blurb = {}
    update_mask = {}

    update_blurb_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_update_blurb_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, update_blurb_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.update_blurb({ blurb: blurb, update_mask: update_mask }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.update_blurb blurb: blurb, update_mask: update_mask do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.update_blurb ::Google::Showcase::V1beta1::UpdateBlurbRequest.new(blurb: blurb, update_mask: update_mask) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.update_blurb({ blurb: blurb, update_mask: update_mask }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.update_blurb(::Google::Showcase::V1beta1::UpdateBlurbRequest.new(blurb: blurb, update_mask: update_mask), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, update_blurb_client_stub.call_count
      end
    end
  end

  def test_delete_blurb
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_blurb_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_delete_blurb_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_blurb_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_blurb({ name: name }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.delete_blurb name: name do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.delete_blurb ::Google::Showcase::V1beta1::DeleteBlurbRequest.new(name: name) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.delete_blurb({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.delete_blurb(::Google::Showcase::V1beta1::DeleteBlurbRequest.new(name: name), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, delete_blurb_client_stub.call_count
      end
    end
  end

  def test_list_blurbs
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::ListBlurbsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_blurbs_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_list_blurbs_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_blurbs_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_blurbs({ parent: parent, page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.list_blurbs parent: parent, page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.list_blurbs ::Google::Showcase::V1beta1::ListBlurbsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.list_blurbs({ parent: parent, page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.list_blurbs(::Google::Showcase::V1beta1::ListBlurbsRequest.new(parent: parent, page_size: page_size, page_token: page_token), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, list_blurbs_client_stub.call_count
      end
    end
  end

  def test_search_blurbs
    # Create test objects.
    client_result = ::Google::Longrunning::Operation.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    query = "hello world"
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    search_blurbs_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_search_blurbs_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, search_blurbs_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.search_blurbs({ query: query, parent: parent, page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use named arguments
        client.search_blurbs query: query, parent: parent, page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object
        client.search_blurbs ::Google::Showcase::V1beta1::SearchBlurbsRequest.new(query: query, parent: parent, page_size: page_size, page_token: page_token) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use hash object with options
        client.search_blurbs({ query: query, parent: parent, page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Use protobuf object with options
        client.search_blurbs(::Google::Showcase::V1beta1::SearchBlurbsRequest.new(query: query, parent: parent, page_size: page_size, page_token: page_token), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end

        # Verify method calls
        assert_equal 5, search_blurbs_client_stub.call_count
      end
    end
  end

  def test_stream_blurbs
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::StreamBlurbsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    expire_time = {}

    stream_blurbs_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:, is_server_streaming:, method_name:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Messaging::Rest::ServiceStub.stub :transcode_stream_blurbs_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, stream_blurbs_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.stream_blurbs({ name: name, expire_time: expire_time }) do |_result, response|
          assert_equal http_response, response.underlying_op
        end.first

        # Use named arguments
        client.stream_blurbs name: name, expire_time: expire_time do |_result, response|
          assert_equal http_response, response.underlying_op
        end.first

        # Use protobuf object
        client.stream_blurbs ::Google::Showcase::V1beta1::StreamBlurbsRequest.new(name: name, expire_time: expire_time) do |_result, response|
          assert_equal http_response, response.underlying_op
        end.first

        # Use hash object with options
        client.stream_blurbs({ name: name, expire_time: expire_time }, call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end.first

        # Use protobuf object with options
        client.stream_blurbs(::Google::Showcase::V1beta1::StreamBlurbsRequest.new(name: name, expire_time: expire_time), call_options) do |_result, response|
          assert_equal http_response, response.underlying_op
        end.first

        # Verify method calls
        assert_equal 5, stream_blurbs_client_stub.call_count
      end
    end
  end

  def test_configure
    credentials_token = :dummy_value

    client = block_config = config = nil
    dummy_stub = ClientStub.new nil
    Gapic::Rest::ClientStub.stub :new, dummy_stub do
      client = ::Google::Showcase::V1beta1::Messaging::Rest::Client.new do |config|
        config.credentials = credentials_token
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Showcase::V1beta1::Messaging::Rest::Client::Configuration, config
  end
end
