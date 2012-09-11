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
default.ssh_known_hosts = ["|1|m4oI5/UqUb5ISBQtpnwsu+TlebY=|wMpL8Cc3YR3a+PoUOMzD35EAMj4= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="]


