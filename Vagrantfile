# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Master node
  config.vm.define "master" do |master|
    master.vm.box = "ambalabanov/rhel-8.4-x86_64"
    master.vm.box_version = "1.1.0"
    master.vm.box_download_insecure =true
    master.vm.hostname = "master.example.com"
    master.vm.network "private_network", ip: "192.168.55.10"
    # master.vm.synced_folder ".", "/vagrant", disabled: true 
    # master.vm.provision "file", source: "hosts", destination: "~/hosts"
    master.vm.provision "shell" do |shell0|
      shell0.privileged = true
      shell0.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    master.vm.provider "parallels" do |prl0|
      # prl0.check_guest_tools = false
      prl0.name = "master"
      prl0.memory = 2048
      prl0.cpus = 2
      # prl0.linked_clone = false
      prl0.customize ["set", :id, "--device-set", "cdrom0", "--image", "rhel-8.4-x86_64-dvd.iso", "--connect"]
    end
  end

  # Managed Node1
  config.vm.define "node1" do |node1|
    node1.vm.box = "ambalabanov/rhel-8.4-x86_64"
    node1.vm.box_version = "1.1.0"
    node1.vm.box_download_insecure =true
    node1.vm.hostname = "node1.example.com"
    node1.vm.network "private_network", ip: "192.168.55.11"
    # node1.vm.synced_folder ".", "/vagrant", disabled: true
    # node1.vm.provision "file", source: "hosts", destination: "~/hosts"
    node1.vm.provision "shell" do |shell1|
      shell1.privileged = true
      shell1.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    node1.vm.provider "parallels" do |prl1|
      # prl1.check_guest_tools = false
      prl1.name = "node1"
      prl1.memory = 1024
      prl1.cpus = 2
      # prl1.linked_clone = false
      prl1.customize ["set", :id, "--device-add", "hdd", "--size", "1024", "--iface", "sata"]
    end
  end

  # Managed Node2
  config.vm.define "node2" do |node2|
    node2.vm.box = "ambalabanov/rhel-8.4-x86_64"
    node2.vm.box_version = "1.1.0"
    node2.vm.box_download_insecure =true
    node2.vm.hostname = "node2.example.com"
    node2.vm.network "private_network", ip: "192.168.55.12"
    # node2.vm.synced_folder ".", "/vagrant", disabled: true
    # node2.vm.provision "file", source: "hosts", destination: "~/hosts"
    node2.vm.provision "shell" do |shell2|
      shell2.privileged = true
      shell2.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    node2.vm.provider "parallels" do |prl2|
      # prl2.check_guest_tools = false
      prl2.name = "node2"
      prl2.memory = 1024
      prl2.cpus = 2
      # prl2.linked_clone = false
    end
  end

  # Managed Node3
  config.vm.define "node3" do |node3|
    node3.vm.box = "ambalabanov/rhel-8.4-x86_64"
    node3.vm.box_version = "1.1.0"
    node3.vm.box_download_insecure =true
    node3.vm.hostname = "node3.example.com"
    node3.vm.network "private_network", ip: "192.168.55.13"
    # node3.vm.synced_folder ".", "/vagrant", disabled: true
    # node3.vm.provision "file", source: "hosts", destination: "~/hosts"
    node3.vm.provision "shell" do |shell3|
      shell3.privileged = true
      shell3.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    node3.vm.provider "parallels" do |prl3|
      # prl3.check_guest_tools = false
      prl3.name = "node3"
      prl3.memory = 1024
      prl3.cpus = 2
      # prl3.linked_clone = false
    end
  end
    
  # Managed Node4
  config.vm.define "node4" do |node4|
    node4.vm.box = "ambalabanov/rhel-8.4-x86_64"
    node4.vm.box_version = "1.1.0"
    node4.vm.box_download_insecure =true
    node4.vm.hostname = "node4.example.com"
    node4.vm.network "private_network", ip: "192.168.55.14"
    # node4.vm.synced_folder ".", "/vagrant", disabled: true
    # node4.vm.provision "file", source: "hosts", destination: "~/hosts"
    node4.vm.provision "shell" do |shell4|
      shell4.privileged = true
      shell4.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    node4.vm.provider "parallels" do |prl4|
      # prl4.check_guest_tools = false
      prl4.name = "node4"
      prl4.memory = 1024
      prl4.cpus = 2
      # prl4.linked_clone = false
    end
  end
  
end