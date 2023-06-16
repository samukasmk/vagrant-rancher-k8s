Vagrant.configure("2") do |config|
  # Define rancher server
  config.vm.define "rancher" do |rancher_server|
    # machine settings
    rancher_server.vm.box = "ubuntu/jammy64"
    rancher_server.vm.provider "virtualbox" do |v|
      v.name = "rancher"
      v.cpus = 4
      v.memory = 6144
    end
    # network settings
    rancher_server.vm.network "public_network", bridge: "wlo1", ip: "192.168.1.200"
    rancher_server.vm.provision "shell", path: "scripts/hosts.sh"
    # install docker
    rancher_server.vm.provision "shell", path: "scripts/install-docker.sh"
    # run rancher server in single node
    rancher_server.vm.provision "shell", path: "scripts/rancher-server.sh"
  end

  # Define k8s nodes
  kubernets_nodes =   {"k8s-1" => "192.168.1.201",
                       "k8s-2" => "192.168.1.202",
                       "k8s-3" => "192.168.1.203"}
  kubernets_nodes.each do |node_name, node_ip|
    config.vm.define node_name do |k8s_node|
      # machine settings
      k8s_node.vm.box = "ubuntu/jammy64"
      k8s_node.vm.provider "virtualbox" do |v|
        v.name = node_name
        v.cpus = 4
        v.memory = 6144
      end
      # network settings
      k8s_node.vm.network "public_network", bridge: "wlo1", ip: node_ip
      k8s_node.vm.provision "shell", path: "scripts/hosts.sh"
      # install docker
      k8s_node.vm.provision "shell", path: "scripts/install-docker.sh"
      # active kubernets nodes in rancher server
      k8s_node.vm.provision "shell", path: "scripts/k8s-nodes.sh"
    end
  end
end
