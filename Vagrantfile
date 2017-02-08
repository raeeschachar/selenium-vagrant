VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = 'https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box'
  
  config.vm.network :forwarded_port, guest:4444, host:4444
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder ".", "/home/vagrant/listentool"
  config.vm.provision "shell", path: "script.sh"

  # X11 forwarding if needed
  config.ssh.forward_x11 = true

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
end
