# This is a Vagrant setup to build the crowbar ISO images #

## Prerequisites ##

Use a Ubuntu 12.04 Vagrant box. 
Its opinionated in a sense as we need ubuntu-12.04 to work, so fork an help to make it more useable for other distros :-)

## Use it ##

```
# downloads the ubuntu 12.04 vagrant box and starts it
vagrant up
# build the iso: 
vagrant ssh -c "cd crowbar; ./build_crowbar.sh ubuntu-12.04"
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

