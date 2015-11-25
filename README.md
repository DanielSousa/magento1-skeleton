### The First Vagrant Up

1. Start with any local operating system such as Mac OS X, Linux, or Windows.
1. Install [VirtualBox 4.3.x](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 1.7.x](https://www.vagrantup.com/downloads.html)
    * `vagrant` will now be available as a command in your terminal, try it out.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.
1. Install the [vagrant-hostmaster](https://github.com/acostamosaicgroup/vagrant-hostmaster) plugin with `vagrant plugin install vagrant-hostsupdater`
1. Run `vagrant up`
1. Run `vagrant ssh`
1. Run `sudo su && passwd vagrant`
1. Enter your password for the user `vagrant`

1. Connect to you database install sample data or restore backup.


### What will install

1. Magento 1.9.2.2
2. `reset-symlinks.sh` script. Running this script all symlinks will be reset.
3. Make sure `Advanced > Developer > Template Settings > Allow Symlinks is enabled