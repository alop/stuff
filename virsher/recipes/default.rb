#
# Cookbook Name:: virsher
# Recipe:: default
#

cookbook_file node['script_dir']['virt-check.py'] do
  source "virt-check.py"
  mode    "0544"
end

cron "virsher" do
  minute  "0"
  command node['script_dir']['virt-check.py']
end

