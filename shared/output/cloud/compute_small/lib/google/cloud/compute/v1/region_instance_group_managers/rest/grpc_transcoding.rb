# frozen_string_literal: true

# Copyright 2021 Google LLC
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


module Google
  module Cloud
    module Compute
      module V1
        module RegionInstanceGroupManagers
          module Rest
            # GRPC transcoding helper methods for the RegionInstanceGroupManagers REST API.
            module GrpcTranscoding
              # @param request_pb [::Google::Cloud::Compute::V1::ResizeRegionInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @return [Array(String, [String, nil], Hash{String => String})]
              #   Uri, Body, Query string parameters
              def transcode_resize request_pb
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/instanceGroupManagers/#{request_pb.instance_group_manager}/resize"
                body = nil
                query_string_params = {}
                query_string_params["requestId"] = request_pb.request_id.to_s if request_pb.has_request_id?
                query_string_params["size"] = request_pb.size.to_s

                [uri, body, query_string_params]
              end
              extend self
            end
          end
        end
      end
    end
  end
end
