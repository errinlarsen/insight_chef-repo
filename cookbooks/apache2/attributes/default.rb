#
# Cookbook Name:: apache2
# Attributes:: apache
#
# Copyright 2008-2009, Opscode, Inc.
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

# Where the various parts of apache are
case platform
when "redhat","centos","fedora","suse"
  set[:apache][:dir]     = "/etc/httpd"
  set[:apache][:log_dir] = "/var/log/httpd"
  set[:apache][:user]    = "apache"
  set[:apache][:binary]  = "/usr/sbin/httpd"
  set[:apache][:icondir] = "/var/www/icons/"
  set[:apache][:cache_dir] = "/var/cache/httpd"
when "debian","ubuntu"
  set[:apache][:dir]     = "/etc/apache2"
  set[:apache][:log_dir] = "/var/log/apache2"
  set[:apache][:user]    = "www-data"
  set[:apache][:binary]  = "/usr/sbin/apache2"
  set[:apache][:icondir] = "/usr/share/apache2/icons"
  set[:apache][:cache_dir] = "/var/cache/apache2"
when "arch"
  set[:apache][:dir]     = "/etc/httpd"
  set[:apache][:log_dir] = "/var/log/httpd"
  set[:apache][:user]    = "http"
  set[:apache][:binary]  = "/usr/sbin/httpd"
  set[:apache][:icondir] = "/usr/share/httpd/icons"
  set[:apache][:cache_dir] = "/var/cache/httpd"
else
  set[:apache][:dir]     = "/etc/apache2"
  set[:apache][:log_dir] = "/var/log/apache2"
  set[:apache][:user]    = "www-data"
  set[:apache][:binary]  = "/usr/sbin/apache2"
  set[:apache][:icondir] = "/usr/share/apache2/icons"
  set[:apache][:cache_dir] = "/var/cache/apache2"
end

###
# These settings need the unless, since we want them to be tunable,
# and we don't want to override the tunings.
###

# General settings
#default[:apache][:listen_ports] = [ "80","443" ]
default[:apache][:listen_ports] = [ "80" ]
default[:apache][:contact] = "support@insightcards.com"
default[:apache][:timeout] = 300
default[:apache][:keepalive] = "Off"
default[:apache][:keepaliverequests] = 100
default[:apache][:keepalivetimeout] = 15

# Security
default[:apache][:servertokens] = "Prod"
default[:apache][:serversignature] = "On"
default[:apache][:traceenable] = "On"

# mod_auth_openids
default[:apache][:allowed_openids] = Array.new

# Prefork Attributes
default[:apache][:prefork][:startservers] = 8
default[:apache][:prefork][:minspareservers] = 5
default[:apache][:prefork][:maxspareservers] = 20
default[:apache][:prefork][:serverlimit] = 256
default[:apache][:prefork][:maxclients] = 256
default[:apache][:prefork][:maxrequestsperchild] = 4000

# Worker Attributes
default[:apache][:worker][:startservers] = 2
default[:apache][:worker][:maxclients] = 150
default[:apache][:worker][:minsparethreads] = 25
default[:apache][:worker][:maxsparethreads] = 75
default[:apache][:worker][:threadsperchild] = 25
default[:apache][:worker][:maxrequestsperchild] = 0
