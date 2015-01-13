require 'fileutils'
require 'open-uri'

CASSANDRA_SERVERS = 3

Vagrant.configure("2") do |config|
  (1..CASSANDRA_SERVERS).each do |vm_number|
    create_vm("cassandra-%02d" % vm_number, vm_number + 100, config, 1024)
  end
  create_vm("datastax-opscenter", 99, config, 1024)
end

def create_vm(vm_name, ip_last_octet, config, memory)
  config.vm.define vm_name do |config|
    config.vm.box = "chef/centos-7.0"
    config.vm.hostname = vm_name
    config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = memory
      vb.cpus = 1
    end

    vm_ip = "192.168.1.#{ip_last_octet}"
    config.vm.network :private_network, ip: vm_ip
  end
end
