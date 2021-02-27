# -*- mode: ruby -*-
# vim: set ft=ruby :
MACHINES = {
  :"systemd-lab" => {
              :box_name => "centos/7",
              :cpus => 2,
              :memory => 1024,
              :net => [],
              :forwarded_port => []
            }
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|
      box.vm.box = boxconfig[:box_name]
      box.vm.host_name = boxname.to_s
      if boxconfig.key?(:net)
        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end
      end
      if boxconfig.key?(:forwarded_port)
        boxconfig[:forwarded_port].each do |port|
          box.vm.network "forwarded_port", port
        end
      end
      box.vm.provider "virtualbox" do |v|
        v.memory = boxconfig[:memory]
        v.cpus = boxconfig[:cpus]
      end
      config.vm.provision "shell", path: "task1/provision1.sh"
      config.vm.provision "shell", path: "task2/provision2.sh"
      config.vm.provision "shell", path: "task3/provision3.sh"
    end
  end
end
