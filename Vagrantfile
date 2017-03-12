# -*- mode: ruby -*-
# vi: set ft=ruby :

# module Host
  # module OS
    # def self.windows?
      # (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    # end

    # def self.mac?
      # (/darwin/ =~ RUBY_PLATFORM) != nil
    # end

    # def self.unix?
      # !windows?
    # end

    # def self.linux?
      # unix? and not mac?
    # end
  # end

  # module Services
    # def self.start
      # mac_start_services if Host::OS.mac?
      # linux_start_services if Host::OS.linux?
    # end

    # def self.stop
      # mac_stop_services if Host::OS.mac?
      # linux_stop_services if Host::OS.linux?
    # end

    # private

    # def self.mac_start_services
      # raise NotInplemented
    # end

    # def self.mac_stop_services
      # raise NotInplemented
    # end

    # def self.linux_start_services
      # raise NotInplemented
    # end

    # def self.linux_stop_services
      # raise NotInplemented
    # end
  # end

  # module Keys
    # def self.share
      # raise NotInplemented
    # end
  # end
# end


# Vagrant plugin installation
unless Vagrant.has_plugin?('vagrant-triggers')
  `vagrant plugin install vagrant-triggers`
  puts "Vagrant Triggers plugin was installed. Please run `vagrant up --provision or vagrant provision` once again."
  exit
end


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # USE_VAGRANT_AS_SERVICES_BOX = false

  # VAGRANT_SERVICES = {
    # redis: 6379,
    # postgresql: 5432,
    # elasticsearch: 9200
  # }

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # if USE_VAGRANT_AS_SERVICES_BOX
    # VAGRANT_SERVICES.keys.each do |services, port|
      # config.vm.network "forwarded_port", guest: port, host: port
    # end

    # config.vm.network "forwarded_port", guest: 5432, host: 5432
    # config.vm.network "forwarded_port", guest: 6379, host: 6379
    # config.vm.network "forwarded_port", guest: 9200, host: 9200

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"
  # end

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.provision :ansible do |ansible|
    ansible.playbook = ".vagrant/provisioner/provision.yml"
    ansible.sudo = true
  end

  # Define vagrant trigeered hook for start and stop services on vagrant up and
  # halt. Before vagrant up you need top forwarded ports services

  # if USE_VAGRANT_AS_SERVICES_BOX
    # config.trigger.before :up do
      # info "Stop host services"
      # Host::Services.stop
    # end

    # config.trigger.before :provision do
      # info "Stop host services"
      # Host::Services.stop
    # end

    # config.trigger.after :halt do
      # info "Start host services"
      # Host::Services.start
    # end

    # config.trigger.after :destroy do
      # info "Start host services"
      # Host::Services.start
    # end
  # else
    # Host::Keys.share
  # end
end
