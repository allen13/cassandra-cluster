require 'fileutils'
require 'open-uri'

CASSANDRA_SERVERS = 3

Vagrant.configure("2") do |config|
  (1..CASSANDRA_SERVERS).each do |vm_number|
    create_vm("cassandra-%02d" % vm_number, vm_number + 100, config, 1024)
  end
  create_opscenter_vm(config)
end

def create_vm(vm_name, ip_last_octet, config, memory)
  config.vm.define vm_name do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = vm_name
    config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = memory
      vb.cpus = 1
    end

    vm_ip = "192.168.1.#{ip_last_octet}"
    config.vm.network :private_network, ip: vm_ip

    4.times do |disk_id|
      add_disk(vm_name, disk_id + 1, 1, config)
    end
  end
end

def add_disk(vm_name, disk_id, gigabytes, config)
  disk_path = "/tmp/#{vm_name}-disk-#{disk_id}.vdi"

  config.vm.provider "virtualbox" do | v |
    unless File.exist?(disk_path)
      v.customize ['createhd', '--filename', disk_path, '--size', gigabytes * 1024]
    end
    v.customize [
      'storageattach',
      :id,
      '--storagectl',
      'SATAController',
      '--port',
      disk_id,
      '--device',
      0,
      '--type',
      'hdd',
      '--medium',
      disk_path
    ]
  end
end

def create_opscenter_vm(config)
  config.vm.define "datastax-opscenter" do |config|
    config.vm.box = "chef/centos-7.0"
    config.vm.hostname = "datastax-opscenter"
    config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 1024
      vb.cpus = 1
    end

    vm_ip = "192.168.1.99"
    config.vm.network :private_network, ip: vm_ip
  end
end
