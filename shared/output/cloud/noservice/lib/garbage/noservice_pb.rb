# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: garbage/noservice.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("garbage/noservice.proto", :syntax => :proto3) do
    add_message "noservice.Hello" do
      optional :name, :string, 1
    end
  end
end

module Noservice
  Hello = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("noservice.Hello").msgclass
end
