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

# [START showcase_v0_generated_Echo_Chat_sync]
require "google/showcase/v1beta1"

##
# Snippet for the chat call in the Echo service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Showcase::V1beta1::Echo::Client#chat. It may require modification in
# order to execute successfully.
#
def chat
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Showcase::V1beta1::Echo::Client.new

  # Create an input stream.
  input = Gapic::StreamInput.new

  # Call the chat method to start streaming.
  output = client.chat input

  # Send requests on the stream. For each request object, set fields by
  # passing keyword arguments. Be sure to close the stream when done.
  input << Google::Showcase::V1beta1::EchoRequest.new
  input << Google::Showcase::V1beta1::EchoRequest.new
  input.close

  # The returned object is a streamed enumerable yielding elements of type
  # ::Google::Showcase::V1beta1::EchoResponse
  output.each do |current_response|
    p current_response
  end
end
# [END showcase_v0_generated_Echo_Chat_sync]
