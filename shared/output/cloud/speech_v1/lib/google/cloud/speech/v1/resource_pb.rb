# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/speech/v1/resource.proto

require 'google/protobuf'

require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/speech/v1/resource.proto", :syntax => :proto3) do
    add_message "google.cloud.speech.v1.CustomClass" do
      optional :name, :string, 1
      optional :custom_class_id, :string, 2
      repeated :items, :message, 3, "google.cloud.speech.v1.CustomClass.ClassItem"
    end
    add_message "google.cloud.speech.v1.CustomClass.ClassItem" do
      optional :value, :string, 1
    end
    add_message "google.cloud.speech.v1.PhraseSet" do
      optional :name, :string, 1
      repeated :phrases, :message, 2, "google.cloud.speech.v1.PhraseSet.Phrase"
      optional :boost, :float, 4
    end
    add_message "google.cloud.speech.v1.PhraseSet.Phrase" do
      optional :value, :string, 1
      optional :boost, :float, 2
    end
    add_message "google.cloud.speech.v1.SpeechAdaptation" do
      repeated :phrase_sets, :message, 1, "google.cloud.speech.v1.PhraseSet"
      repeated :phrase_set_references, :string, 2
      repeated :custom_classes, :message, 3, "google.cloud.speech.v1.CustomClass"
    end
  end
end

module Google
  module Cloud
    module Speech
      module V1
        CustomClass = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.CustomClass").msgclass
        CustomClass::ClassItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.CustomClass.ClassItem").msgclass
        PhraseSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.PhraseSet").msgclass
        PhraseSet::Phrase = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.PhraseSet.Phrase").msgclass
        SpeechAdaptation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.speech.v1.SpeechAdaptation").msgclass
      end
    end
  end
end
