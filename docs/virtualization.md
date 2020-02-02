# Virtualization


## Virtualization Providers
The notable virtualization providers are 
* [Virtual Box](https://www.virtualbox.org/) from Oracle
* [VMware Workstation](https://www.vmware.com/uk/products/workstation-pro/) from VMware

My suggestion is to download VirtualBox as it supports most OS and more importantly it integrates
with [Vagrant](https://www.vagrantup.com/).

## VM Provisioning
You can manually download your preferred OS iso from internet, such as [Ubuntu](https://ubuntu.com/download/desktop)
and install all the necessary software by hand, but this is not the preferred approach as you will need 
to repeat those steps every time you would want to create a VM instance; unless you clone the VM.

### VM Automated provisioning
**Enter Vagrant!** We will use Vagrant to automate all the steps.

#### Hardware
You will need 50GB of free space

**Highly recommend** 
* SSD hard drive
* \>4GB memory provided to the VM

#### Software
Installation steps:
* Download [Virtual box](https://www.virtualbox.org/wiki/Downloads) version 6.1 and up
* Download [Vagrant](https://www.vagrantup.com/) version  2.2.7 and up
* Open a command line window (e.g. cmd) and install the plugins
    * ```vagrant plugin install vagrant-vbguest```
    * ```vagrant plugin install vagrant-disksize```

You will need to reboot your PC after the installations.

#### VM creation
Clone this git repo using [git](https://git-scm.com/) or any other git supporting software like 
[GitHub Desktop](https://desktop.github.com/) or simply download the 
[zip](https://github.com/tensorflowRUs/ai-environment-setup/archive/master.zip) of the repo.

* open an terminal window to your desired location 
    * **Git** Enter command ```git clone https://github.com/tensorflowRUs/ai-environment-setup.git```
    * **Zip**  Unizp using any software available
 * Navigate to folder vagrant; e.g. ```cd ai-environment-setup\vagrant```
* type command ```vagrant up```
* **have a coffee!** as the first time it will download Ubuntu from Vagrant Cloud, subsequent 
commands to create new VM instances will be much shorter as the OS is stored locally. The software described in the 
[index](index.md) are included in the VM instance.
    

You will notice that Vagrant will start executing all the necessary commands to install the software 
in your VM instance that is created in Virtual Box.

After the successful installation you can login to the newly created TensorflowRUs VM instance using 
the credentials
* username ```ubuntu```
* password ```ubuntu``` 

## Issues
If you encounter any issues please raise an GitHub issue on the 
[repo](https://github.com/tensorflowRUs/ai-environment-setup/issues).
Add details such as 
* OS version
* architecture 32 vs 64 bit
* error messages
