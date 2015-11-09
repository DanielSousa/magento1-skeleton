# -*- mode: ruby -*-
# vi: set ft=ruby :

hostname = "tugagento.dev"
virtualbox_ip = "10.0.2.100";

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Virtualbox customization
  config.vm.provider :virtualbox do |virtualbox, override|

    # Which box?
    override.vm.box = "puppetlabs/debian-7.8-64-puppet"
    override.vm.box_version = "1.0.2"

    # Customize VM
    virtualbox.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "4", "--pae", "on", "--hwvirtex", "off", "--ioapic", "on"]
    virtualbox.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    virtualbox.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    virtualbox.name = hostname

    # Network
    override.vm.network :private_network, ip: virtualbox_ip

  end

  # Network
  # config.vm.network :private_network, ip: "10.0.0.232"
  config.hostmanager.enabled            = true
  config.hostmanager.manage_host        = true
  config.hostmanager.ignore_private_ip  = false
  config.hostmanager.include_offline    = true
  config.vm.hostname                    = hostname

  # Synced folders
  #config.vm.synced_folder "", "/vagrant"
  #config.vm.synced_folder "htdocs", "/var/www/magento"
  config.vm.synced_folder "", "/vagrant", nfs: true,
                                  mount_options: ["nolock", "async"],
                                  bsd__nfs_options: ["alldirs","async","nolock"]

  # "Provision" with hostmanager
  config.vm.provision :hostmanager

  # Puppet!
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path   = "puppet/manifests"
    puppet.module_path      = "puppet/modules"
    puppet.manifest_file    = "init.pp"
    puppet.options = ['--verbose']

    # Factors
    puppet.facter = {
        "vagrant"           => "1",
        "hostname"          => hostname,
        "db_root_password"  => "mysql",
        "db_user"           => "magento",
        "db_password"       => "magento",
        "db_name"           => "magento",
        "db_name_tests"     => "magento_tests",
        "document_root"     => "/vagrant/htdocs",
        "logs_dir"          => "/var/www/logs",
    }
  end

end

# Local file
begin
  load 'LocalVagrantfile.rb'
rescue LoadError
  # ignore
end
