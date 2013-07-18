# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hospitalsites_86"
  config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui
config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "192.168.33.10"

  #config.vm.host_name = "hospitalsites.local"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  config.vm.network :bridged
 # config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
 #config.vm.provider :virtualbox do |vb|
    #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#end
  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080
  #config.ssh.host
  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  #config.vm.synced_folder ".", "/vagrant", :extra => "dmode=777,fmode=777
  config.vm.share_folder "v-www", "/var/www/html", "./webroot", :extra => 'dmode=775,fmode=775'
  #config.vm.share_folder "v-data", "/data", "./data"

  #config.vm.provision :puppet,
  #  :options => ["--fileserverconfig=fileserver.conf"],
  #  :facter => { "fqdn" => "vagrant.vagrantup.com" }  do |puppet|
  #     puppet.manifests_path = "manifests"
  #     puppet.manifest_file = "lamp.pp"
  #     puppet.module_path = "modules"
 # end
# Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "../vagrant_guide/roles"
    chef.cookbooks_path = ["../vagrant_guide/site-cookbooks", "../vagrant_guide/cookbooks"]
    chef.add_role "vagrant-test-box"
    #chef.add_role "webserver"
  end
  
  config.vm.provision "shell", inline: "service iptables stop"
  config.vm.provision "shell", path: "test.sh"
  config.vm.provision "shell", path: "installdrush.sh"

end
