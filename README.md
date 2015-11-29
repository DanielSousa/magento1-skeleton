
### Requirements 

1. Install [VirtualBox 4.3.x](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 1.7.x](https://www.vagrantup.com/downloads.html)
1. Install the [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager) plugin with `vagrant plugin install vagrant-hostmanager`


### Create project with composer

`composer create-project danielsousa/magento1-skeleton`


### The First Vagrant Up

1. Edit the `Vagrantfile`: `vim Vagrantfile`   
    1. Change the VM IP if needed. Default is: `10.0.0.2` (`10.0.0.1` is your machine)
    1. Change the RAM or number of CPUs if needed.
    1. On the puppet part: change the factors
        1. Change `hostname` with the development domain of your website
        1. Change `db_*` variables with your information or keep default values
1. Start with any local operating system such as Mac OSX, Linux.
1. Run `vagrant up`
1. Run `vagrant ssh`
1. Run `sudo su && passwd vagrant`
1. Enter your password for the user `vagrant`

1. Connect to you database install sample data or restore backup.


### What will install

* Magento 1.9.2.2
* `reset-symlinks.sh` script. Running this script all symlinks will be reset.
*  Make sure `Advanced > Developer > Template Settings > Allow Symlinks is enabled


#### Packages

Are installed:

* apache-mpm-itk (with magento virtualhost)
* mysql-server (with custom my.cnf)
* mysql-client
* php5 (and some modules)
* screen (with custom .screenrc for root)
* vim
* wget
* curl
* git
* composer.phar
* mailcatcher (gem)

#### For Magento developers

* [n98-magerun.phar][magerun]
* [modman][modman]
* [The Installer][installer]


[vagrant]: http://vagrantup.com
[installer]: https://github.com/jacquesbh/Installer#readme
[modman]: https://github.com/colinmollenhour/modman
[magerun]: https://github.com/netz98/n98-magerun
[mailcatcher]: http://mailcatcher.me


### Additional information

#### Import database

If file exists `database.sql.gz` in the main directory (where the Vagrantfile is), puppet will import the database during the first `up`.

### Virtualhost

Per default the variable `MAGE_IS_DEVELOPER_MODE` is set to true.

The virtualhost is set on the `htdocs` directory.

### Mails

[MailCatcher][mailcatcher] is installed and configured into the `/etc/php5/apache2/php.ini` file.

#### How it works

If mailcatcher is stopped: all emails are lost.

If mailcatcher is started: **all emails are catched**.

If you want to start MailCatcher, simply run this command (with vagrant user) : `mailcatcher --ip 0.0.0.0`

Then go to : http://definedhostname:1080

If you need to stop the mailcatcher daemon : Click on "Quit" on the top right corner of the MailCatcher Web UI.


### Credits

This vagrant machine as created based on [monsieurbiz](https://github.com/monsieurbiz/vagrant-magento) project
