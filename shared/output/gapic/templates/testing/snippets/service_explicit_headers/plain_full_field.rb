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

# [START testing_v0_generated_ServiceExplicitHeaders_PlainFullField_sync]
require "testing/routing_headers"

##
# Snippet for the plain_full_field call in the ServiceExplicitHeaders service
#
# This is an auto-generated example demonstrating basic usage of
# Testing::RoutingHeaders::ServiceExplicitHeaders::Client#plain_full_field. It
# may require modification in order to execute successfully.
#
def plain_full_field
  # Create a client object. The client can be reused for multiple calls.
  client = Testing::RoutingHeaders::ServiceExplicitHeaders::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Testing::RoutingHeaders::Request.new

  # Call the plain_full_field method.
  result = client.plain_full_field request

  # The returned object is of type Testing::RoutingHeaders::Response.
  p result
end
# [END testing_v0_generated_ServiceExplicitHeaders_PlainFullField_sync]
