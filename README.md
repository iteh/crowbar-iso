# This is a Vagrant setup to build the crowbar ISO images #

## Prerequisites ##

Use a Ubuntu 12.04 Vagrant box. It is already configured so a ```vagrant up``` will do the right thing.
Its opinionated in a sense as we need ubuntu-12.04 to work, so fork an help to make it more useable for other distros :-) 

You can prepare the build by putting the ubuntu cloud iso and the centos iso in the shared folder: 

- http://vault.centos.org/6.2/isos/x86_64/CentOS-6.2-x86_64-bin-DVD1.iso 
- http://releases.ubuntu.com/12.04/ubuntu-12.04-server-amd64.iso

```
$ ls -al share/iso/
total 17335648
drwxr-xr-x  9 ehaselwanter  staff         306 Aug  8 23:09 .
drwxr-xr-x  5 ehaselwanter  staff         170 May 15 22:45 ..
-rw-r--r--  1 ehaselwanter  staff  4423129088 Aug  6 11:49 CentOS-6.2-x86_64-bin-DVD1.iso
-rw-rw-r--  1 ehaselwanter  staff   312981628 Aug  6 14:13 sledgehammer-tftpboot.tar.gz
-rw-r--r--@ 1 ehaselwanter  staff   717533184 Apr 25 15:29 ubuntu-12.04-server-amd64.iso
```

## Use it ##

```
# downloads the ubuntu 12.04 vagrant box and starts it
vagrant up
# build the iso: 
vagrant ssh -c "cd crowbar; ./build_crowbar.sh ubuntu-12.04"  
# or ./build_crowbar.sh ubuntu-12.04 --update-cache
```  
this can take a very long time to build (at least at the first time) 

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

