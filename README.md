# This is a Vagrant setup to build the crowbar ISO images #

## Prerequisites ##

Use a Ubuntu 10.10 Vagrant box. If you don't have one you can build one

Install Virtualbox 

Install Vagrant and Veewee

gem install vagrant
gem install veewee

vagrant basebox build 'ubuntu-10.10-server-amd64'
vagrant basebox validate ubuntu-10.10-server-amd64
vagrant basebox export   ubuntu-10.10-server-amd64

vagrant box add 'ubuntu-10.10-server-amd64' 'ubuntu-10.10-server-amd64.box'

vagrant up

this can take a very long time to build (at least at the first time)

