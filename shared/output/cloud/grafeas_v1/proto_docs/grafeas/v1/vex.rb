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


module Grafeas
  module V1
    # A single VulnerabilityAssessmentNote represents
    # one particular product's vulnerability assessment for one CVE.
    # @!attribute [rw] title
    #   @return [::String]
    #     The title of the note. E.g. `Vex-Debian-11.4`
    # @!attribute [rw] short_description
    #   @return [::String]
    #     A one sentence description of this Vex.
    # @!attribute [rw] long_description
    #   @return [::String]
    #     A detailed description of this Vex.
    # @!attribute [rw] language_code
    #   @return [::String]
    #     Identifies the language used by this document,
    #     corresponding to IETF BCP 47 / RFC 5646.
    # @!attribute [rw] publisher
    #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Publisher]
    #     Publisher details of this Note.
    # @!attribute [rw] product
    #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Product]
    #     The product affected by this vex.
    # @!attribute [rw] assessment
    #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Assessment]
    #     Represents a vulnerability assessment for the product.
    class VulnerabilityAssessmentNote
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods

      # Publisher contains information about the publisher of
      # this Note.
      # (-- api-linter: core::0123::resource-annotation=disabled
      #     aip.dev/not-precedent: Publisher is not a separate resource. --)
      # @!attribute [rw] name
      #   @return [::String]
      #     Name of the publisher.
      #     Examples: 'Google', 'Google Cloud Platform'.
      # @!attribute [rw] issuing_authority
      #   @return [::String]
      #     Provides information about the authority of the issuing party to
      #     release the document, in particular, the party's constituency and
      #     responsibilities or other obligations.
      # @!attribute [rw] publisher_namespace
      #   @return [::String]
      #     The context or namespace.
      #     Contains a URL which is under control of the issuing party and can
      #     be used as a globally unique identifier for that issuing party.
      #     Example: https://csaf.io
      class Publisher
        include ::Google::Protobuf::MessageExts
        extend ::Google::Protobuf::MessageExts::ClassMethods
      end

      # Product contains information about a product and how to uniquely identify
      # it.
      # (-- api-linter: core::0123::resource-annotation=disabled
      #     aip.dev/not-precedent: Product is not a separate resource. --)
      # @!attribute [rw] name
      #   @return [::String]
      #     Name of the product.
      # @!attribute [rw] id
      #   @return [::String]
      #     Token that identifies a product so that it can be referred to from other
      #     parts in the document. There is no predefined format as long as it
      #     uniquely identifies a group in the context of the current document.
      # @!attribute [rw] generic_uri
      #   @return [::String]
      #     Contains a URI which is vendor-specific.
      #     Example: The artifact repository URL of an image.
      class Product
        include ::Google::Protobuf::MessageExts
        extend ::Google::Protobuf::MessageExts::ClassMethods
      end

      # Assessment provides all information that is related to a single
      # vulnerability for this product.
      # @!attribute [rw] cve
      #   @deprecated This field is deprecated and may be removed in the next major version update.
      #   @return [::String]
      #     Holds the MITRE standard Common Vulnerabilities and Exposures (CVE)
      #     tracking number for the vulnerability.
      #     Deprecated: Use vulnerability_id instead to denote CVEs.
      # @!attribute [rw] vulnerability_id
      #   @return [::String]
      #     The vulnerability identifier for this Assessment. Will hold one of
      #     common identifiers e.g. CVE, GHSA etc.
      # @!attribute [rw] short_description
      #   @return [::String]
      #     A one sentence description of this Vex.
      # @!attribute [rw] long_description
      #   @return [::String]
      #     A detailed description of this Vex.
      # @!attribute [rw] related_uris
      #   @return [::Array<::Grafeas::V1::RelatedUrl>]
      #     Holds a list of references associated with this vulnerability item and
      #     assessment. These uris have additional information about the
      #     vulnerability and the assessment itself. E.g. Link to a document which
      #     details how this assessment concluded the state of this vulnerability.
      # @!attribute [rw] state
      #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Assessment::State]
      #     Provides the state of this Vulnerability assessment.
      # @!attribute [rw] impacts
      #   @return [::Array<::String>]
      #     Contains information about the impact of this vulnerability,
      #     this will change with time.
      # @!attribute [rw] justification
      #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Assessment::Justification]
      #     Justification provides the justification when the state of the
      #     assessment if NOT_AFFECTED.
      # @!attribute [rw] remediations
      #   @return [::Array<::Grafeas::V1::VulnerabilityAssessmentNote::Assessment::Remediation>]
      #     Specifies details on how to handle (and presumably, fix) a vulnerability.
      class Assessment
        include ::Google::Protobuf::MessageExts
        extend ::Google::Protobuf::MessageExts::ClassMethods

        # Justification provides the justification when the state of the
        # assessment if NOT_AFFECTED.
        # @!attribute [rw] justification_type
        #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Assessment::Justification::JustificationType]
        #     The justification type for this vulnerability.
        # @!attribute [rw] details
        #   @return [::String]
        #     Additional details on why this justification was chosen.
        class Justification
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Provides the type of justification.
          module JustificationType
            # JUSTIFICATION_TYPE_UNSPECIFIED.
            JUSTIFICATION_TYPE_UNSPECIFIED = 0

            # The vulnerable component is not present in the product.
            COMPONENT_NOT_PRESENT = 1

            # The vulnerable code is not present. Typically this case
            # occurs when source code is configured or built in a way that excludes
            # the vulnerable code.
            VULNERABLE_CODE_NOT_PRESENT = 2

            # The vulnerable code can not be executed.
            # Typically this case occurs when the product includes the vulnerable
            # code but does not call or use the vulnerable code.
            VULNERABLE_CODE_NOT_IN_EXECUTE_PATH = 3

            # The vulnerable code cannot be controlled by an attacker to exploit
            # the vulnerability.
            VULNERABLE_CODE_CANNOT_BE_CONTROLLED_BY_ADVERSARY = 4

            # The product includes built-in protections or features that prevent
            # exploitation of the vulnerability. These built-in protections cannot
            # be subverted by the attacker and cannot be configured or disabled by
            # the user. These mitigations completely prevent exploitation based on
            # known attack vectors.
            INLINE_MITIGATIONS_ALREADY_EXIST = 5
          end
        end

        # Specifies details on how to handle (and presumably, fix) a vulnerability.
        # @!attribute [rw] remediation_type
        #   @return [::Grafeas::V1::VulnerabilityAssessmentNote::Assessment::Remediation::RemediationType]
        #     The type of remediation that can be applied.
        # @!attribute [rw] details
        #   @return [::String]
        #     Contains a comprehensive human-readable discussion of the remediation.
        # @!attribute [rw] remediation_uri
        #   @return [::Grafeas::V1::RelatedUrl]
        #     Contains the URL where to obtain the remediation.
        class Remediation
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The type of remediation that can be applied.
          module RemediationType
            # No remediation type specified.
            REMEDIATION_TYPE_UNSPECIFIED = 0

            # A MITIGATION is available.
            MITIGATION = 1

            # No fix is planned.
            NO_FIX_PLANNED = 2

            # Not available.
            NONE_AVAILABLE = 3

            # A vendor fix is available.
            VENDOR_FIX = 4

            # A workaround is available.
            WORKAROUND = 5
          end
        end

        # Provides the state of this Vulnerability assessment.
        module State
          # No state is specified.
          STATE_UNSPECIFIED = 0

          # This product is known to be affected by this vulnerability.
          AFFECTED = 1

          # This product is known to be not affected by this vulnerability.
          NOT_AFFECTED = 2

          # This product contains a fix for this vulnerability.
          FIXED = 3

          # It is not known yet whether these versions are or are not affected
          # by the vulnerability. However, it is still under investigation.
          UNDER_INVESTIGATION = 4
        end
      end
    end
  end
end
