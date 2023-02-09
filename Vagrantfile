# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"


  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "centsrv" do |centsrv|
    centsrv.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "net1"
    centsrv.vm.hostname = "centsrv"
    centsrv.vm.provision "shell", path: "nfs_centsrv.sh"
  end

  config.vm.define "centcl" do |centcl|
    centcl.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: "net1"
    centcl.vm.hostname = "centcl"
    centcl.vm.provision "shell", path: "nfs_centcl.sh"

  end

end