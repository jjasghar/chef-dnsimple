#
# Copyright:: Copyright (c) 2010-2011, Heavy Water Software
# Copyright:: Copyright (c) 2011, Joshua Timberman
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :create, :destroy

default_action :create

attribute :domain,   kind_of: String
attribute :name,     kind_of: String
attribute :type,     kind_of: String, equal_to: %w(A CNAME ALIAS MX SPF URL TXT NS SRV NAPTR PTR AAA SSHFP HFINO)
attribute :content,  kind_of: [String, Array]
attribute :ttl,      kind_of: Integer, default: 3600
attribute :priority, kind_of: Integer
attribute :username, kind_of: String
attribute :password, kind_of: String
attribute :token,    kind_of: String

attr_accessor :exists
