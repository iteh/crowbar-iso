#
# Cookbook Name:: sledgehammer 
# Recipe:: build
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

# https://github.com/dellcloudedge/crowbar/wiki/Build-sledgehammer-tar

%W{git rpm ruby curl}.each do |package_name|
  package package_name
end 

crowbar_sledgehammer_repo_local_uri = "/home/vagrant/crowbar-sledgehammer"

git crowbar_sledgehammer_repo_local_uri do
  repository "git://github.com/dellcloudedge/crowbar-sledgehammer.git"
  reference "master"
  action :sync
end 

remote_file node.sledgehammer.centos_local_uri do
  source node.sledgehammer.centos_download_url
  mode "0644"
  action :create_if_missing
end

crowbar_sledgehammer_tar_local_uri = File.join(crowbar_sledgehammer_repo_local_uri,"bin/sledgehammer-tftpboot.tar.gz") 

bash "build sledgehammer" do
  environment ({"CENTOS_ISO" => node.sledgehammer.centos_local_uri}) 
  cwd crowbar_sledgehammer_repo_local_uri
  code "./build_sledgehammer.sh" 
  creates crowbar_sledgehammer_tar_local_uri
end 

bash "unpack sledgehammer" do
  cwd node.sledgehammer.build_cache_path
  code "tar xzvf #{crowbar_sledgehammer_tar_local_uri}" 
  creates File.join(node.sledgehammer.build_cache_path,"tftpboot")
end 

