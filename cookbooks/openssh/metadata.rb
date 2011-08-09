maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs openssh"
version           "0.8.1"

recipe "openssh", "Installs openssh"

%w{ redhat centos fedora ubuntu debian arch}.each do |os|
  supports os
end

attribute "sshd/port",
  :display_name => "Port number",
  :description => "Port number on which to accept ssh connections",
  :default => "22"

attribute "sshd/pubkey_auth",
  :display_name => "Enable public key authentication",
  :description => "Enable to allow public key authentication",
  :default => "true"

attribute "sshd/password_auth",
  :display_name => "Enable password authentication",
  :description => "Enable to allow plaintext password authentication",
  :default => "true"

attribute "sshd/permit_root_login",
  :display_name => "Allow root login",
  :description => "Enable to allow root user logins",
  :default => "true"

attribute "sshd/use_dns",
  :display_name => "Use DNS",
  :description => "Enable to perform server-side DNS lookups on connecting hosts",
  :default => "false"
