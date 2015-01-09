require 'fileutils'
require 'open-uri'

CASSANDRA_SERVERS = 3

Vagrant.configure("2") do |config|
  (1..CASSANDRA_SERVERS).each do |vm_number|
    create_opentsdb_vm(vm_number, config, 1024)
  end
end

def create_opentsdb_vm(vm_number, config, memory)
  vm_name = "cassandra-%02d" % vm_number

  config.vm.define vm_name do |config|
    config.vm.box = "chef/centos-7.0"
    config.vm.hostname = vm_name
    config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = memory
      vb.cpus = 1
    end

    vm_ip = "192.168.1.#{vm_number + 100}"
    config.vm.network :private_network, ip: vm_ip
  end
end
