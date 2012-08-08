#
# Cookbook Name:: crowbar 
# Attributes:: default
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

default.sledgehammer.filename = "sledgehammer-tftpboot.tar.gz" 
default.sledgehammer.crowbar_build_cache_path = "/home/vagrant/crowbar-build-cache"
default.sledgehammer.tftpboot_path = File.join(node.sledgehammer.crowbar_build_cache_path,"/tftpboot")
default.sledgehammer.downloaded_archive = File.join(node.sledgehammer.crowbar_build_cache_path,node.sledgehammer.filename) 

default.crowbar.repository_url = "git://github.com/dellcloudedge/" 
default.crowbar.repository_ref = "release/essex-hack/openstack-os-build" 
default.crowbar.repo_local_uri = "/home/vagrant/crowbar"


