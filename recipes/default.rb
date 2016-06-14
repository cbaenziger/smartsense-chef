#
# Cookbook Name:: smartsense-chef
# Recipe:: default
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

include_recipe "smartsense-chef::smartsense_setup"
filename = "#{Chef::Config[:file_cache_path]}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb"
package_src = "#{node['smartsense-chef']['repo_url']}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb"
remote_file filename do
   source package_src
   mode '0770'
   action :create_if_missing
   checksum node['smartsense-chef']['checksum']
   not_if { node['smartsense-chef']['use_local_repo'] || File::exists?(filename) }
end

# install smartsense package on a node
dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb" do
   action :install
   not_if { node['smartsense-chef']['use_local_repo'] }	
end

package "smartsense-hst" do
   only_if { node['smartsense-chef']['use_local_repo'] }
#   version '1.2.2'
end

# SmartSense results are more accurate with the following dependencies installed
%w{wget sysstat dstat lsof net-tools python2.7}.each do |pkg|
   package pkg do
   end
end
