#https://github.com/dellcloudedge/crowbar/wiki/Build-Crowbar.ISO

%W{git genisoimage build-essential debootstrap mkisofs binutils ruby curl}.each do |package_name|
  package package_name
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
