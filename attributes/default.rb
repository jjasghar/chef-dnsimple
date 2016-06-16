#
# Cookbook Name:: dnsimple
# Attributes:: default
#
# Copyright 2014-2016 Aetrion, LLC
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
#

default["dnsimple"]["version"] = "2.2.0" # Version of the DNSimple gem to use
default["dnsimple"]["username"] = nil    # DNSimple username
default["dnsimple"]["token"] = nil       # DNSimple api token
default["dnsimple"]["domain"] = nil      # Default domain to use
