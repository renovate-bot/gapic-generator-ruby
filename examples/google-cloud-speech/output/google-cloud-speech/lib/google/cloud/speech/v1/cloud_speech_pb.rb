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

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/speech/v1/cloud_speech.proto

require "google/protobuf"

require "google/api/annotations_pb"
require "google/longrunning/operations_pb"
require "google/protobuf/any_pb"
require "google/protobuf/duration_pb"
require "google/protobuf/empty_pb"
require "google/protobuf/timestamp_pb"
require "google/rpc/status_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.speech.v1.RecognizeRequest" do
    optional :config, :message, 1, "google.cloud.speech.v1.RecognitionConfig"
    optional :audio, :message, 2, "google.cloud.speech.v1.RecognitionAudio"
  end
  add_message "google.cloud.speech.v1.LongRunningRecognizeRequest" do
    optional :config, :message, 1, "google.cloud.speech.v1.RecognitionConfig"
    optional :audio, :message, 2, "google.cloud.speech.v1.RecognitionAudio"
  end
  add_message "google.cloud.speech.v1.StreamingRecognizeRequest" do
    oneof :streaming_request do
      optional :streaming_config, :message, 1, "google.cloud.speech.v1.StreamingRecognitionConfig"
      optional :audio_content, :bytes, 2
    end
  end
  add_message "google.cloud.speech.v1.StreamingRecognitionConfig" do
    optional :config, :message, 1, "google.cloud.speech.v1.RecognitionConfig"
    optional :single_utterance, :bool, 2
    optional :interim_results, :bool, 3
  end
  add_message "google.cloud.speech.v1.RecognitionConfig" do
    optional :encoding, :enum, 1, "google.cloud.speech.v1.RecognitionConfig.AudioEncoding"
    optional :sample_rate_hertz, :int32, 2
    optional :language_code, :string, 3
    optional :max_alternatives, :int32, 4
    optional :profanity_filter, :bool, 5
    repeated :speech_contexts, :message, 6, "google.cloud.speech.v1.SpeechContext"
    optional :enable_word_time_offsets, :bool, 8
    optional :enable_automatic_punctuation, :bool, 11
    optional :model, :string, 13
    optional :use_enhanced, :bool, 14
  end
  add_enum "google.cloud.speech.v1.RecognitionConfig.AudioEncoding" do
    value :ENCODING_UNSPECIFIED, 0
    value :LINEAR16, 1
    value :FLAC, 2
    value :MULAW, 3
    value :AMR, 4
    value :AMR_WB, 5
    value :OGG_OPUS, 6
    value :SPEEX_WITH_HEADER_BYTE, 7
  end
  add_message "google.cloud.speech.v1.SpeechContext" do
    repeated :phrases, :string, 1
  end
  add_message "google.cloud.speech.v1.RecognitionAudio" do
    oneof :audio_source do
      optional :content, :bytes, 1
      optional :uri, :string, 2
    end
  end
  add_message "google.cloud.speech.v1.RecognizeResponse" do
    repeated :results, :message, 2, "google.cloud.speech.v1.SpeechRecognitionResult"
  end
  add_message "google.cloud.speech.v1.LongRunningRecognizeResponse" do
    repeated :results, :message, 2, "google.cloud.speech.v1.SpeechRecognitionResult"
  end
  add_message "google.cloud.speech.v1.LongRunningRecognizeMetadata" do
    optional :progress_percent, :int32, 1
    optional :start_time, :message, 2, "google.protobuf.Timestamp"
    optional :last_update_time, :message, 3, "google.protobuf.Timestamp"
  end
  add_message "google.cloud.speech.v1.StreamingRecognizeResponse" do
    optional :error, :message, 1, "google.rpc.Status"
    repeated :results, :message, 2, "google.cloud.speech.v1.StreamingRecognitionResult"
    optional :speech_event_type, :enum, 4, "google.cloud.speech.v1.StreamingRecognizeResponse.SpeechEventType"
  end
  add_enum "google.cloud.speech.v1.StreamingRecognizeResponse.SpeechEventType" do
    value :SPEECH_EVENT_UNSPECIFIED, 0
    value :END_OF_SINGLE_UTTERANCE, 1
  end
  add_message "google.cloud.speech.v1.StreamingRecognitionResult" do
    repeated :alternatives, :message, 1, "google.cloud.speech.v1.SpeechRecognitionAlternative"
    optional :is_final, :bool, 2
    optional :stability, :float, 3
  end
  add_message "google.cloud.speech.v1.SpeechRecognitionResult" do
    repeated :alternatives, :message, 1, "google.cloud.speech.v1.SpeechRecognitionAlternative"
  end
  add_message "google.cloud.speech.v1.SpeechRecognitionAlternative" do
    optional :transcript, :string, 1
    optional :confidence, :float, 2
    repeated :words, :message, 3, "google.cloud.speech.v1.WordInfo"
  end
  add_message "google.cloud.speech.v1.WordInfo" do
    optional :start_time, :message, 1, "google.protobuf.Duration"
    optional :end_time, :message, 2, "google.protobuf.Duration"
    optional :word, :string, 3
  end
end

module Google
  module Cloud
    module Speech
      module V1
        RecognizeRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.RecognizeRequest").msgclass
        LongRunningRecognizeRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.LongRunningRecognizeRequest").msgclass
        StreamingRecognizeRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.StreamingRecognizeRequest").msgclass
        StreamingRecognitionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.StreamingRecognitionConfig").msgclass
        RecognitionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.RecognitionConfig").msgclass
        RecognitionConfig::AudioEncoding = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.RecognitionConfig.AudioEncoding").enummodule
        SpeechContext = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.SpeechContext").msgclass
        RecognitionAudio = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.RecognitionAudio").msgclass
        RecognizeResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.RecognizeResponse").msgclass
        LongRunningRecognizeResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.LongRunningRecognizeResponse").msgclass
        LongRunningRecognizeMetadata = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.LongRunningRecognizeMetadata").msgclass
        StreamingRecognizeResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.StreamingRecognizeResponse").msgclass
        StreamingRecognizeResponse::SpeechEventType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.StreamingRecognizeResponse.SpeechEventType").enummodule
        StreamingRecognitionResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.StreamingRecognitionResult").msgclass
        SpeechRecognitionResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.SpeechRecognitionResult").msgclass
        SpeechRecognitionAlternative = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.SpeechRecognitionAlternative").msgclass
        WordInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.WordInfo").msgclass
      end
    end
  end
end
