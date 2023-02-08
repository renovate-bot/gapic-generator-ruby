# frozen_string_literal: true

# Copyright 2023 Google LLC
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

# [START speech_v1_generated_Adaptation_GetPhraseSet_sync]
require "google/cloud/speech/v1"

##
# Snippet for the get_phrase_set call in the Adaptation service
#
# This is an auto-generated example demonstrating basic usage of
# Google::Cloud::Speech::V1::Adaptation::Client#get_phrase_set. It may require
# modification in order to execute successfully.
#
def get_phrase_set
  # Create a client object. The client can be reused for multiple calls.
  client = Google::Cloud::Speech::V1::Adaptation::Client.new

  # Create a request. To set request fields, pass in keyword arguments.
  request = Google::Cloud::Speech::V1::GetPhraseSetRequest.new

  # Call the get_phrase_set method.
  result = client.get_phrase_set request

  # The returned object is of type Google::Cloud::Speech::V1::PhraseSet.
  p result
end
# [END speech_v1_generated_Adaptation_GetPhraseSet_sync]
