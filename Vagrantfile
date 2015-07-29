Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-7.0"
  #config.vm.network "private_network", type: "dhcp"
  # config.vm.hostname = "chef-client"
  config.vm.network "private_network", ip: "172.28.128.6"
  #config.vm.network "private_network", type: "dhcp"

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8006
end
