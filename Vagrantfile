# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.   

  config.vm.customize do |vm|
    vm.memory_size = 2048
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  #config.vm.network :hostonly, "10.11.12.13", :adapter => 4

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 22, 6666

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "share", "/home/vagrant/share", "./share"
  #config.vm.share_folder "crowbar-build-cache", "/root/crowbar-build-cache", "./crowbar-build-cache"


  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "base.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  #
   config.vm.provision :chef_solo do |chef|   
     
     chef.log_level = :debug
     
     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "apt"
     chef.add_recipe "crowbar"  

     # You may also specify custom JSON attributes:
     chef.json = { 
       :wipe_cache => true,
       :crowbar => {
         :repository_ref => 'release/fred/openstack-os-build',  
         :repository_url => 'git://github.com/dellcloudedge/'
         },
       :sledgehammer => {
         :strategy => "build",
         :centos_download_url => 'http://vault.centos.org/6.2/isos/x86_64/CentOS-6.2-x86_64-bin-DVD1.iso',
         :centos_local_uri => '/home/vagrant/share/iso/CentOS-6.2-x86_64-bin-DVD1.iso' 
         } 
       }
   end

   #config.vm.provision :shell do |shell|
    #shell.inline = "cd /root/crowbar/ ; ./build_crowbar.sh ubuntu-12.04 --update-cache"
    #shell.inline = "cd /root/crowbar/ ; ./build_crowbar.sh ubuntu-12.04"
    #shell.args = "'write this to a file'"
   #end
  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # IF you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
   
end
