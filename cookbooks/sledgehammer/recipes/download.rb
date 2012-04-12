

directory node.sledgehammer.tftpboot_path do
  recursive true
  action :delete
end if node.sledgehammer.prune_sledgehammer

bash "untar sledgehammer" do
  code %Q{tar -xzvf #{node.sledgehammer.downloaded_archive}}
  cwd node.sledgehammer.crowbar_build_cache_path
  action :nothing
  not_if do
    File.exists?(File.join(node.sledgehammer.tftpboot_path,"initrd0.img"))
  end
end

remote_file node.sledgehammer.downloaded_archive do
  source node.sledgehammer.download_url
  action :nothing
  notifies :run, resources(:bash => "untar sledgehammer"), :immediately
end

http_request "HEAD #{node.sledgehammer.download_url}" do
  message ""
  url node.sledgehammer.download_url
  action :head
  if File.exists?(node.sledgehammer.downloaded_archive)
    headers "If-Modified-Since" => File.mtime(node.sledgehammer.downloaded_archive).httpdate
  end
  notifies :create, resources(:remote_file => node.sledgehammer.downloaded_archive), :immediately
end


