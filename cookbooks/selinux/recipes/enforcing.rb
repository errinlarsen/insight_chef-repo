#
# Author:: Sean OMeara (<someara@opscode.com>)
# Cookbook Name:: selinux
# Recipe:: enforcing
#
# Copyright 2011, Opscode, Inc.
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

package "libselinux-ruby" do
  action :install
end

execute "enable selinux enforcement" do
  not_if "selinuxenabled"
  command "setenforce 1"
  action :run
end

template "/etc/sysconfig/selinux" do
  source "sysconfig/selinux.erb"
  variables(
    :selinux => "enforcing",
    :selinuxtype => "targeted"
  )
end

