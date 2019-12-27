#!/bin/bash

# configure puppet and puppetserver
yum install -y https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppetserver puppetdb puppetdb-termini
yum install -y puppet

# enable puppet server
systemctl enable puppetserver

# reduce memory usage on puppetserver
sed -i -e 's/2g/1g/g' /etc/sysconfig/puppetserver

# define DNS alternative names with the FQDN to the master server
echo "dns_alt_names = puppet.home.hhj.no,puppet

[main]
certname = puppet.home.hhj.no 
server = puppet.home.hhj.no
environment = production
runinterval = 1h" >> /etc/puppetlabs/puppet/puppet.conf

systemctl enable puppetserver
systemctl start puppetserver
