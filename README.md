# This is a Vagrant box setup to build the Crowbar Openstack ISO image #

## Prerequisites ##

### Vagrant ###

Get and install [Vagrant](http://vagrantup.com) as well as [Virtualbox](https://www.virtualbox.org)

### Download OS ISO Images to build from

Use a Ubuntu 12.04 Vagrant box. It is already configured as 

    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
in the Vagrantfile, so a ```vagrant up``` will do the right thing. 

Its opinionated as we need ubuntu-12.04 to work, so fork the repository and help to make it more useable for other linux distributions :-) 

You can prepare the build by putting the ubuntu cloud iso and the centos iso in the shared iso folder: 
    
    cd share/iso
    curl -O http://vault.centos.org/6.2/isos/x86_64/CentOS-6.2-x86_64-bin-DVD1.iso 
    curl -o ubuntu-12.04-server-amd64.iso http://releases.ubuntu.com/12.04/ubuntu-12.04.1-server-amd64.iso

    $ ls -al share/iso/
    total 17335648
    drwxr-xr-x  9 ehaselwanter  staff         306 Aug  8 23:09 .
    drwxr-xr-x  5 ehaselwanter  staff         170 May 15 22:45 ..
    -rw-r--r--  1 ehaselwanter  staff  4423129088 Aug  6 11:49 CentOS-6.2-x86_64-bin-DVD1.iso
    -rw-r--r--@ 1 ehaselwanter  staff   717533184 Apr 25 15:29 ubuntu-12.04-server-amd64.iso

if you download the iso AFTER starting the vagrant you might need to reload the vagrant instance due to shareing problems between the host und the guest os.

## Use it ##

The first ```vagrant up``` will download the ubuntu 12.04 vagrant box and start it

  vagrant up

### build the iso: 

    vagrant ssh  
    cd crowbar 
    ./build_crowbar.sh ubuntu-12.04"  
    # or ./build_crowbar.sh ubuntu-12.04 --update-cache

this can take a very long time to build. if you start on a fresh install it first builds the discovery image (tftpboot - a centos image) and next the ubuntu iso. 

to update the repo do a provision:

```
vagrant provision
```
which will fetch the latest essex branch


to update just the barclamps: (e.g. new distro packages )

```
./build_crowbar.sh ubuntu-12.04 --no-iso --update-cache
ls ../crowbar-build-cache/ubuntu-12.04/build/dell/barclamps/
```
## TODO ##

- add option for submodule change update after failure in one of the submodules (e.g. missing deploy key)
- add ssh remote host fingerprint
- 

