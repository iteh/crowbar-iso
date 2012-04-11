

directory node.sledgehammer.build_cache_path do
  recursive true
  action :delete
end if node[:crowbar] && node.crowbar.prune_build_cache

directory node.sledgehammer.build_cache_path do
  action :create
end

bash "untar sledgehammer" do
  code %Q{tar -xzvf /tmp/sledgehammer-tftpboot.tar.gz}
  cwd node.sledgehammer.build_cache_path
  action :nothing
  not_if do
    File.exists?(File.join(node.sledgehammer.build_cache_path,"tftpboot"))
  end
end

remote_file "/tmp/sledgehammer-tftpboot.tar.gz" do
  source node.sledgehammer.download_url
  action :nothing
  notifies :run, resources(:bash => "untar sledgehammer"), :immediately
end

http_request "HEAD #{node.sledgehammer.download_url}" do
  message ""
  url node.sledgehammer.download_url
  action :head
  if File.exists?("/tmp/sledgehammer-tftpboot.tar.gz")
    headers "If-Modified-Since" => File.mtime("/tmp/sledgehammer-tftpboot.tar.gz").httpdate
  end
  notifies :create, resources(:remote_file => "/tmp/sledgehammer-tftpboot.tar.gz"), :immediately
end


