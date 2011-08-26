#
# Author:: Sean OMeara (<someara@opscode.com>)
# Cookbook Name:: selinux
# Recipe:: disabled
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

PKGS = %w[
  which
  screen
  mysql-devel
  mysql-server
  libxml2-devel
  libxslt-devel
  curl-devel
  nc
  httpd-devel
  apr-devel
]

GEMS = {
  "rails"                       => {:version => '2.3.3'},
  "mysql"                       => {:version => '2.8.1', :options => "-- -with-mysql-config=’/usr/bin/mysql_config’"}, 
  "alexvollmer-daemon-spawn"    => {:version => '0.2.0', :source => 'http://gems.github.com'},
  "memcache-client"             => {:version => '1.8.5'},
  "collectiveidea-delayed_job"  => {:version => '1.8.2', :source => 'http://gems.github.com'},
  "uuidtools"                   => {:version => '2.1.1'},
  "haml"                        => {:version => '2.0.9'},
  "ezcrypto"                    => {:version => '0.7.2'},
  "nokogiri"                    => {:version => '1.4.3.1'},
  "fastercsv"                   => {:version => '1.5.3'},
  "spreadsheet"                 => {:version => '0.6.4.1'},
  "calendar_date_select"        => {:version => '1.16.1'},
  "selecium-client"             => {:version => '1.2.18'},
  "thoughtbot-shoulda"          => {:version => '2.10.1', :source => 'http://gems.github.com'},
  "flexmock"                    => {:version => '0.8.7'},
  "jgre-monkeyspecdoc"          => {:version => '0.9.5', :source => 'http://gems.github.com'},
  "spicycode-rcov"              => {:version => '0.8.2.1', :source => 'http://gems.github.com'},
  "mislav-will_paginate"        => {:version => '2.3.11', :source => 'http://gems.github.com'},
  "thoughtbot-factory_girl"     => {:version => '>=1.2.2', :source => 'http://gems.github.com'},
  "macaddr"                     => {:version => '1.0.0'},
  "rubyzip"                     => {:version => '0.9.4'},
  "rubyist-aasm"                => {:version => '2.1.1', :source => 'http://gems.github.com'},
  "clickatell"                  => {:version => '0.8.2'},
  "hiroshi-pony"                => {:version => '0.8.2', :source => 'http://gems.github.com'},
  "httparty"                    => {:version => '0.5.2'},
  "net-sftp"                    => {:version => '>=2.0.2'},
  "slither"                     => {:version => '0.99.4'},
  "redis"                       => {:version => '2.1.1'},
  "resque"                      => {:version => '1.10.0'},
  "system_timer"                => {:version => '1.0'},
  "delorean"                    => {:version => '0.2.1'},
  "god"                         => {:version => '0.11.0'},
  "bundler"                     => {},
  "pdfkit"                      => {:version => '0.4.6'},
  "yard"                        => {:version => '0.6.5'}
}

PKGS.each do |pkg|
  package pkg do
    action :install
  end
end

GEMS.each do |gem, opts|
  gem_package gem do
    version GEMS[gem][:version] unless GEMS[gem][:version].nil?
    source GEMS[gem][:source] unless GEMS[gem][:source].nil?
    options GEMS[gem][:options] unless GEMS[gem][:options].nil?
  end
end
