

directory node.sledgehammer.build_cache_path do
  recursive true
  action :delete
end if node.crowbar.prune_build_cache

directory node.sledgehammer.build_cache_path do
  action :create
end

remote_file "/tmp/sledgehammer-tftpboot.tar.gz" do
  source default.sledgehammer.download_url
  action :nothing
end
 
http_request "HEAD #{default.sledgehammer.download_url}" do
  message ""
  url default.sledgehammer.download_url
  action :head
  if File.exists?("/tmp/sledgehammer-tftpboot.tar.gz")
    headers "If-Modified-Since" => File.mtime("/tmp/sledgehammer-tftpboot.tar.gz").httpdate
  end
  notifies :create, resources(:remote_file => "/tmp/sledgehammer-tftpboot.tar.gz"), :immediately
end


