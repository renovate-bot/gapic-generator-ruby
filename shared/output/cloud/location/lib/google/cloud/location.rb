# frozen_string_literal: true

# Copyright 2025 Google LLC
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

require "google/cloud/location/locations"
require "google/cloud/location/version"

module Google
  module Cloud
    ##
    # API client module.
    #
    # @example Load this package, including all its services, and instantiate a gRPC client
    #
    #     require "google/cloud/location"
    #     client = ::Google::Cloud::Location::Locations::Client.new
    #
    # @example Load this package, including all its services, and instantiate a REST client
    #
    #     require "google/cloud/location"
    #     client = ::Google::Cloud::Location::Locations::Rest::Client.new
    #
    module Location
    end
  end
end

helper_path = ::File.join __dir__, "location", "_helpers.rb"
require "google/cloud/location/_helpers" if ::File.file? helper_path
