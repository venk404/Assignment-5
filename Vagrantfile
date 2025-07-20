Vagrant.configure("2") do |config|
  # Use Ubuntu 20.04 LTS as base box
  config.vm.box = "bento/ubuntu-22.04"
  
  # Network configuration
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  # VM configurations
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = 1
    vb.name = "production-env5"
  end
  
  
  # Provision the VM using setup script

 config.vm.provision "shell", path: "setup.sh"
end