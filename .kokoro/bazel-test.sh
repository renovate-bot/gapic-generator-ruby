#!/bin/bash
# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eo pipefail

apt-get update -y
apt-get install -y jq

GAPIC_GENERATOR_COMMIT=$1
if [[ -z "${GAPIC_GENERATOR_COMMIT}" ]]
then
  echo "GAPIC_GENERATOR_COMMIT not set, trying default"
  echo "Usage: $0 <commit-sha>"
  exit 1
fi

git clone --depth=1 https://github.com/googleapis/googleapis
pushd googleapis

# debug bazel version
bazelisk --version

echo "Testing gapic-generator-ruby with ${GAPIC_GENERATOR_COMMIT}"

# update current version of gapic-generator-ruby
jq ".ruby.commit = \"${GAPIC_GENERATOR_COMMIT}\" | .ruby.version = null | .ruby.sha = null" generator-versions.json > generator-versions2.json
mv generator-versions2.json generator-versions.json
cat generator-versions.json

# try generating the google/example/library/v1 ruby gapic library
bazelisk build //google/example/library/v1:google-cloud-example-library-v1-ruby

# try generating the google/ads/googleads/v20 ruby gapic library
bazelisk build //google/ads/googleads/v20:googleads-ruby

popd
