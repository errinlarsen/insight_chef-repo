default[:passenger][:version]     = "2.2.15"
default[:passenger][:max_pool_size] = "50"
default[:passenger][:root_path]   = "#{languages[:ruby][:gems_dir]}/gems/passenger-#{passenger[:version]}"
default[:passenger][:module_path] = "#{passenger[:root_path]}/ext/apache2/mod_passenger.so"
#Ruby stuff..
#LoadModule passenger_module /opt/ruby-enterprise-1.8.7-2010.01/lib/ruby/gems/1.8/gems/passenger-2.2.15/ext/apache2/mod_passenger.so
#PassengerRoot /opt/ruby-enterprise-1.8.7-2010.01/lib/ruby/gems/1.8/gems/passenger-2.2.15
#PassengerRuby /opt/ruby-enterprise-1.8.7-2010.01/bin/ruby
#
#
#StartServers          25
#MinSpareServers       25
#MaxSpareServers       50
#MaxClients           256
#MaxRequestsPerChild    0
#
#PassengerMaxPoolSize 50
#PassengerUseGlobalQueue on
##end ruby stuff
