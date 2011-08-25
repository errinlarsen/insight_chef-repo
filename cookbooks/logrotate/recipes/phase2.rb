#
# Cookbook Name:: logrotate
# Recipe:: phase2
#
# Copyright 2009, Opscode, Inc.
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

logrotate_app "railsPhase2" do
  template "phase2.erb"
  path "/home/deployer/insightcards.net/phase2-production2/shared/log/*.log"
  frequency "daily"
  rotate 120
end

logrotate_app "railsPhase1" do
  template "phase1.erb"
  path "/home/deployer/insightcards.net/production/shared/log/*.log"
  frequency "daily"
  rotate 120
end
