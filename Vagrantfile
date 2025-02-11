Vagrant.configure("2") do |config|
  # Define k8s node configs
  rancher_nodes = {"rancher"      => {"type" => "master", "ip" => "192.168.0.240"},
                   "k8s-master-1" => {"type" => "agent",  "ip" => "192.168.0.241"},
                   "k8s-worker-a" => {"type" => "agent",  "ip" => "192.168.0.251"},
                   "k8s-worker-b" => {"type" => "agent",  "ip" => "192.168.0.252"},
                   "k8s-worker-c" => {"type" => "agent",  "ip" => "192.168.0.253"}}

  # Declare vms
  rancher_nodes.each do |hostname, node|
    config.vm.define hostname do |machine|
      # machine settings
      machine.vm.box = "ubuntu/jammy64"
      machine.vm.hostname = hostname
      machine.vm.provider "virtualbox" do |v|
        v.name = hostname
        v.cpus = 4
        v.memory = 5125
      end

      # network settings
      machine.vm.network "public_network", ip: node["ip"], bridge: "wlo1"

      # set hostname on restarts
      machine.vm.provision "shell", inline: "sudo hostnamectl set-hostname #{hostname}"

      # set etc hosts
      machine.vm.provision "shell", path: "scripts/etc_hosts.sh"

      # install docker
      machine.vm.provision "shell", path: "scripts/install-docker.sh"

      # install rancher node instructions
      if node["type"] == "master"
        # run rancher server in single node
        machine.vm.provision "shell", path: "scripts/rancher-server.sh"
      else
        # active kubernets nodes in rancher server
        machine.vm.provision "shell", path: "scripts/k8s-nodes.sh"
      end

    end

  end
end
