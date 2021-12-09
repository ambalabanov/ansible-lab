# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Master node
  config.vm.define "master" do |master|
    master.vm.box = "ambalabanov/rhel-8.5-x86_64"
    # master.vm.box_version = "1.1.0"
    master.vm.box_download_insecure =true
    master.vm.hostname = "master.example.com"
    master.vm.network "private_network", ip: "192.168.55.10"
    master.vm.provision "shell" do |shell0|
      shell0.privileged = true
      shell0.inline = <<-SHELL
        cp -f /vagrant/hosts /etc/hosts
      SHELL
    end
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/00-subscription.yml"
      ansible.ask_vault_pass = true
    end
    master.vm.provision "shell" do |shell00|
      shell00.privileged = true
      shell00.inline = <<-SHELL
        ssh-keygen -f ~/.ssh/id_rsa -N ""
        ssh-keyscan -H master.example.com >> ~/.ssh/known_hosts
        ssh-keyscan -H node1.example.com >> ~/.ssh/known_hosts
        ssh-keyscan -H node2.example.com >> ~/.ssh/known_hosts
        ssh-keyscan -H node3.example.com >> ~/.ssh/known_hosts
        ssh-keyscan -H node4.example.com >> ~/.ssh/known_hosts
        sshpass -p vagrant ssh-copy-id master.example.com
        sshpass -p vagrant ssh-copy-id node1.example.com
        sshpass -p vagrant ssh-copy-id node2.example.com
        sshpass -p vagrant ssh-copy-id node3.example.com
        sshpass -p vagrant ssh-copy-id node4.example.com
      SHELL
    end
    master.vm.provider "parallels" do |prl0|
      # prl0.check_guest_tools = false
      prl0.update_guest_tools = false
      prl0.name = "master"
      prl0.memory = 2048
      prl0.cpus = 2
      # prl0.linked_clone = false
      prl0.customize ["set", :id, "--device-set", "cdrom0", "--image", "rhel-8.5-x86_64-dvd.iso", "--connect"]
    end
    master.trigger.before :destroy do |trigger|
      trigger.name = "Unregister RHN Guest"
      trigger.warn = "Unregister"
      trigger.run_remote = {inline: <<-SHELL
      subscription-manager remove --all
      subscription-manager unregister
      subscription-manager clean
      SHELL
      }
    end
  end

  # Managed 4 Nodes
  (1..4.to_i).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "ambalabanov/rhel-8.5-x86_64"
      # node.vm.box_version = "1.1.0"
      node.vm.box_download_insecure =true
      node.vm.hostname = "node#{i}.example.com"
      node.vm.network "private_network", ip: "192.168.55.1#{i}"
      node.vm.provision "shell" do |shell|
        shell.privileged = true
        shell.inline = <<-SHELL
          cp -f /vagrant/hosts /etc/hosts
        SHELL
      end
      node.vm.provider "parallels" do |prl|
        # prl.check_guest_tools = false
        prl.update_guest_tools = false
        prl.name = "node#{i}"
        prl.memory = 1024
        prl.cpus = 2
        # prl.linked_clone = false
        prl.customize ["set", :id, "--device-add", "hdd", "--size", "1024", "--iface", "sata"]
      end
    end
  end  
end