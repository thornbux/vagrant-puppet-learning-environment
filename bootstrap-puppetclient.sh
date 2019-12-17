#!/bin/bash
yum install -y https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppet

# define DNS alternative names with the FQDN to the master server
echo "
[main]
#certname = puppetclient.home.hhj.no
server = puppet.home.hhj.no
environment = production
runinterval = 1h" >> /etc/puppetlabs/puppet/puppet.conf

