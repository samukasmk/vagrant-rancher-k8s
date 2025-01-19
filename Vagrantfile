Vagrant.configure("2") do |config|
  # Define rancher server
  rancher_servers = {"rancher" => "192.168.1.200"}

  rancher_servers.each do |server_name, server_ip|

    config.vm.define server_name do |rancher_server|
      # machine settings
      rancher_server.vm.box = "ubuntu/jammy64"
      rancher_server.vm.hostname = server_name
      rancher_server.vm.provider "virtualbox" do |v|
        v.name = server_name
        v.cpus = 4
        v.memory = 6144
      end
      # network settings
      rancher_server.vm.network "public_network", bridge: "wlo1", ip: server_ip
      # set hostname on restarts
      rancher_server.vm.provision "shell", inline: "sudo hostnamectl set-hostname #{server_name}"
      # set etc hosts
      rancher_server.vm.provision "shell", path: "scripts/etc_hosts.sh"
      # install docker
      rancher_server.vm.provision "shell", path: "scripts/install-docker.sh"
      # run rancher server in single node
      rancher_server.vm.provision "shell", path: "scripts/rancher-server.sh"
    end

  end

  # Define k8s nodesagent_ip
  rancher_agents = {"k8s-1" => "192.168.1.201",
                    "k8s-2" => "192.168.1.202",
                    "k8s-3" => "192.168.1.203"}

  rancher_agents.each do |agent_name, agent_ip|

    config.vm.define agent_name do |rancher_agent|
      # machine settings
      rancher_agent.vm.box = "ubuntu/jammy64"
      rancher_agent.vm.hostname = agent_name
      rancher_agent.vm.provider "virtualbox" do |v|
        v.name = agent_name
        v.cpus = 4
        v.memory = 6144
      end
      # network settings
      rancher_agent.vm.network "public_network", bridge: "wlo1", ip: agent_ip
      # set hostname on restarts
      rancher_agent.vm.provision "shell", inline: "sudo hostnamectl set-hostname #{agent_name}"
      # set etc hosts
      rancher_agent.vm.provision "shell", path: "scripts/etc_hosts.sh"
      # install docker
      rancher_agent.vm.provision "shell", path: "scripts/install-docker.sh"
      # active kubernets nodes in rancher server
      # rancher_agent.vm.provision "shell", path: "scripts/k8s-nodes.sh"
    end

  end
end
