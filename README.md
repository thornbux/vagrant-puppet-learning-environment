# vagrant-puppet-learning-environment
This is my Vagrant config to learn Puppet 5 in a small lab environment.
It consists of one Puppetserver and two Puppet clients.

## Config
Bash bootstrap scripts installs and configures the VMs with latest available Puppetserver and clients.

## Usage
To use this environment you need to install Vagrant, I have chosen LibVirt as my virtualization engine on a Ubuntu 18.04.
```
$ sudo apt install vagrant git
```

### Create a Vagrant workdir
```
$ mkdir -p vagrant/puppet
$ cd vagrant/puppet
```

### Clone my repo
```
$ git clone https://github.com/thornbux/vagrant-puppet-learning-environment.git
```

### Start up the engines
#### To build the test lab
We are adding a CentOS 7 VM as our desired OS and starting it up.
```
$ vagrant box add centos/7 
$ vagrant up
```

#### List available VMs
```
$ vagrant status
Current machine states:

puppetserver              running (libvirt)
puppetclient01            running (libvirt)
puppetclient02            running (libvirt)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

#### SSH into a VM
```
$ vagrant ssh puppetserver
```

You can ping your neighbour from inside the VM.
Hostnames is defined in the Vagrant file.

#### Destroy the lab
```
$ vagrant destroy
```

#### Reprovision lab
```
$ vagrant provision
```

## Puppet preparation
SSH into the puppetserver
```
vagrant ssh puppetserver
sudo -i
```

### List certificates
```
puppet cert list 
  "puppetclient01.home.hhj.no" (SHA256) DF:17:68:C4:C3:6F:7E:E6:EE:96:C3:AF:7D:8C:D8:60:F7:8C:6F:97:6B:6A:51:88:43:A1:6A:3F:80:91:80:89
  "puppetclient02.home.hhj.no" (SHA256) 29:ED:9F:A4:D4:CC:24:86:67:71:CB:94:F8:66:BA:A3:CC:55:BC:D8:0B:CD:17:20:8E:BD:51:CA:FF:43:58:F0
```

### Sign certificate(s)
```
puppet cert sign <hostname>
```



