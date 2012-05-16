#
# Cookbook Name:: sledgehammer 
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

# download or build sledgehammer
default.sledgehammer.strategy = "download"
# build from scratch ?
default.sledgehammer.prune_sledgehammer = false
default.sledgehammer.centos_download_url = "http://ftp.riken.jp/Linux/centos/5.6/isos/x86_64/CentOS-5.6-x86_64-bin-DVD-1of2.iso"
# for crowbar 1.2 and 1.3
#default.sledgehammer.download_url = "http://crowbar.zehicle.com/sledgehammer-tftpboot.tar.gz"
# for crowbar 1.3

default.sledgehammer.filename = "sledgehammer-tftpboot.tar.gz" 
default.sledgehammer.download_url = "http://crowbar.zehicle.com/20120215/#{node.sledgehammer.filename}"
default.sledgehammer.centos_local_uri = "/home/vagrant/share/iso/CentOS-5.6-x86_64-bin-DVD-1of2.iso" 
default.sledgehammer.crowbar_build_cache_path = "/home/vagrant/share/crowbar-build-cache"
default.sledgehammer.tftpboot_path = File.join(node.sledgehammer.crowbar_build_cache_path,"/tftpboot")
default.sledgehammer.downloaded_archive = File.join(node.sledgehammer.crowbar_build_cache_path,node.sledgehammer.filename) 
