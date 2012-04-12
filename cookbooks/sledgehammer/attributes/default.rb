
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
default.sledgehammer.centos_local_uri = "/root/iso/CentOS-5.6-x86_64-bin-DVD-1of2.iso" 
default.sledgehammer.crowbar_build_cache_path = "/root/.crowbar-build-cache"
default.sledgehammer.tftpboot_path = File.join(node.sledgehammer.crowbar_build_cache_path,"/tftpboot")
default.sledgehammer.downloaded_archive = File.join(node.sledgehammer.crowbar_build_cache_path,node.sledgehammer.filename) 
