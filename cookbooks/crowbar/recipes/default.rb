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

%W{openssl git genisoimage build-essential debootstrap mkisofs binutils ruby curl}.each do |package_name|
  package package_name do
    action :upgrade
  end
end 

crowbar_repo_local_uri = "/root/crowbar"

git crowbar_repo_local_uri do
  repository "git://github.com/dellcloudedge/crowbar.git"
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
