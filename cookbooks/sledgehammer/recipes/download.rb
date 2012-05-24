#
# Cookbook Name:: sledgehammer 
# Recipe:: download
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

directory node.sledgehammer.tftpboot_path do
  recursive true   
  owner "vagrant"
  action :delete
end if node.sledgehammer.prune_sledgehammer

bash "untar sledgehammer" do
  code %Q{tar -xzvf #{node.sledgehammer.downloaded_archive}}
  cwd node.sledgehammer.crowbar_build_cache_path
  user "vagrant"
  not_if do
    File.exists?(File.join(node.sledgehammer.tftpboot_path,"initrd0.img"))
  end 
  only_if do
    File.exists?(node.sledgehammer.downloaded_archive)    
  end
end

remote_file node.sledgehammer.downloaded_archive do
  source node.sledgehammer.download_url
  action :nothing  
  owner "vagrant"
  notifies :run, resources(:bash => "untar sledgehammer"), :immediately
end

http_request "HEAD #{node.sledgehammer.download_url}" do
  message ""
  url node.sledgehammer.download_url
  action :nothing
  if File.exists?(node.sledgehammer.downloaded_archive)
    headers "If-Modified-Since" => File.mtime(node.sledgehammer.downloaded_archive).httpdate
  end
  notifies :create, resources(:remote_file => node.sledgehammer.downloaded_archive), :immediately
end


