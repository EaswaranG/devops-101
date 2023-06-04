## Installation on Mac
### VirtualBox install
```
curl https://download.virtualbox.org/virtualbox/6.1.42/VirtualBox-6.1.42-155177-OSX.dmg   -o /tmp/virtualbox.dmg
hdiutil mount /tmp/virtualbox.dmg
sudo installer -pkg /Volumes/VirtualBox/*.pkg -target /
hdiutil unmount /tmp/virtualbox.dmg
```

### Vagrant install
```
curl https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_darwin_amd64.dmg -o /tmp/vagrant.dmg
hdiutil mount /tmp/vagrant.dmg
sudo installer -pkg /Volumes/Vagrant/*.pkg -target /
hdiutil unmount /tmp/vagrant.dmg
```

## Installation on Windows

### Dependancies
* Install [Chocolatey](https://chocolatey.org/install)
* Update [PowerShell 5.1](https://docs.microsoft.com/en-us/powershell/wmf/5.1/install-configure)
   - Command to check your current PowerShell version (using powershell console)
```
$PSVersionTable.PSVersion
```
If the version is not 5.1, then update from [here](https://docs.microsoft.com/en-us/powershell/wmf/5.1/install-configure)


### Install Vagrant
* In a PowerShell Prompt (run as an administrator):
```
choco install vagrant --version 2.3.4
```
* Manual Installaltion: [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

### Install Virtualbox
* On same PowerShell Prompt (run as an administrator):
```
choco install virtualbox --version 6.1.42
```
* Vagrantfile configuration: https://developer.hashicorp.com/vagrant/docs/vagrantfile/version
* Manual Installaltion: [Virtualbox](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)


### Check Your Virtual Network address
- Run `ipconfig`
```
Ethernet adapter VirtualBox Host-Only Network:

   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::66ad:c4cd:d815:e435%43
   IPv4 Address. . . . . . . . . . . : 192.168.56.1
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . :
```
- Use `192.168.56.X` IP address in your Vagrantfile to assign IP address for your VM

### Create Vagrantfile
Use the attached file named Vagrantfile

### Create VM:
* Open git-bash or terminal and execute:
```
cd testvm
vagrant up
```

### Update hosts file
* Update your hosts (for windows: C:\Windows\System32\drivers\etc\hosts or for Mac/Unix: /etc/hosts) files with the entry:
```
192.168.56.3   myweb.local
```
then browse http:/myweb.local


## VM operation commands using vagrant:
For any operation, first go to specific VM folder in `Git-Bash` and then try followings:
- To destroy a VM, and execute `vagrant destroy`

- To shutdown a VM, execute `vagrant halt`

- To start a VM, execute `vagrant up`

- To relaod a VM, execute `vagrant reload`

- To reprovision a VM, execute `vagrant provision`

- To reprovision and reload a VM, execute `vagrant reload --provision`

- To SSH/login into the VM, execute `vagrant ssh`

