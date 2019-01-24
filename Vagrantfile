# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "mysql1" do |mysql1|
    mysql1.vm.network "private_network", ip: "192.168.50.22"
    mysql1.vm.hostname = "mysql1"
    mysql1.vm.provider :virtualbox do |vb|
          vb.name = "mysql1"
    end
    mysql1.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "mysql1.yml"
    end
  end

  config.vm.define "prometheus1" do |prometheus1|
    prometheus1.vm.network "private_network", ip: "192.168.50.21"
    prometheus1.vm.hostname = "Prometheus1"
    prometheus1.vm.provider :virtualbox do |vb|
        vb.name = "Prometheus1"
    end
    prometheus1.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "prometheus1.yml"
    end
  end
  
  config.vm.define "mysql2" do |mysql2|
    mysql2.vm.network "private_network", ip: "192.168.50.24"
    mysql2.vm.hostname = "mysql2"
    mysql2.vm.provider :virtualbox do |vb|
          vb.name = "mysql2"
    end
    mysql2.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "mysql2.yml"
    end
  end

  config.vm.define "prometheus2" do |prometheus2|
    prometheus2.vm.network "private_network", ip: "192.168.50.23"
    prometheus2.vm.hostname = "Prometheus2"
    prometheus2.vm.provider :virtualbox do |vb|
        vb.name = "Prometheus2"
    end
    prometheus2.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "prometheus2.yml"
    end
  end

  config.vm.define "prometheus3" do |prometheus3|
    prometheus3.vm.network "private_network", ip: "192.168.50.25"
    prometheus3.vm.hostname = "Prometheus3"
    prometheus3.vm.provider :virtualbox do |vb|
        vb.name = "Prometheus3"
    end
    prometheus3.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "prometheus3.yml"
    end
  end
end
