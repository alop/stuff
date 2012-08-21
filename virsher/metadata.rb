maintainer        "Abel Lopez"
maintainer_email  "alopgeek@gmail.com"
description       "A script to ensure nova-compute instances are in virsh"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"
recipe            "virsher", "Installs the script, sets a cronjob"

%w{ debian ubuntu centos suse fedora redhat scientific oracle}.each do |os|
  supports os
end

attribute "virsher/script_dir",
  :display_name => "Script Directory",
  :description => "The directory to install in",
  :default => "/usr/local/bin/"
