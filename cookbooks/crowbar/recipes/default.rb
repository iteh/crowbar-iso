#
# Cookbook Name:: crowbar 
# Recipe:: default
#
# Copyright 2012, Deutsche Telekom Laboratories 
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

#https://github.com/dellcloudedge/crowbar/wiki/Build-Crowbar.ISO          

template "/home/vagrant/.build-crowbar.conf" do
  source "build-crowbar.conf"
  owner "vagrant"
end

%W{openssl curl git build-essential debootstrap mkisofs binutils rpm ruby rubygems genisoimage}.each do |package_name|
  package package_name do
    action :upgrade
  end
end 

# add your hosts tot the known hosts
template "/home/vagrant/.ssh/known_hosts" do
  source "known_hosts.erb"
  owner "vagrant"
  mode "0664"
end   

# add your deploy key if there is one
file "/home/vagrant/.ssh/id_rsa" do
  content node.deploy_key
  not_if { node.deploy_key.nil? }
  owner "vagrant"
  mode 0600
end

git node.crowbar.repo_local_uri do   
  user "vagrant"
  repository "#{node.crowbar.repository_url}crowbar.git"
  reference node.crowbar.repository_ref 
  enable_submodules true
  action :sync
end 

#bash "build crowbar" do
#  environment ({"CACHE_DIR" => node.sledgehammer.build_cache_path}) 
#  cwd crowbar_sledgehammer_repo_local_uri
#  code "./build_crowbar.sh" 
  #creates crowbar_sledgehammer_tar_local_uri
#end 
