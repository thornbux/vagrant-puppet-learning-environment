# vagrant-puppet-learning-environment
This is my Vagrant config to learn Puppet 5 in a small lab environment.
It consists of one Puppetserver and two Puppet clients.

## Config
Bash bootstrap scripts installs and configures the VMs with latest available Puppetserver and clients.

## Usage
To use this environment you need to install Vagrant, I have chosen LibVirt as my virtualization engine on a Ubuntu 18.04.
$ sudo apt install vagrant git

### Create a Vagrant workdir
$ mkdir -p vagrant/puppet
$ cd vagrant/puppet

### Clone my repo
$ git clone https://github.com/thornbux/vagrant-puppet-learning-environment.git

### Start up the engines
#### To build the test lab
$ vagrant up

#### List available VMs
$ vagrant status

#### SSH into a VM
$ vagrant ssh puppetserver

#### Destroy the lab
$ vagrant destroy

#### Reprovision lab
$ vagrant provision


