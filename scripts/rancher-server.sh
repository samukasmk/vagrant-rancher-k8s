#docker network create --subnet=172.18.0.0/16 rancher
#docker run --net mynet123 --ip 172.18.0.22 -it ubuntu bash

# install rancher single node
install_rancher_single_node () {
    sudo docker run -d \
        --name rancher \
        --restart=unless-stopped \
        -v /opt/rancher:/var/lib/rancher \
        -p 80:80 \
        -p 443:443 \
        --privileged \
        rancher/rancher:v2.10.2;
    return $?
}

helper_instructions () {
    echo "Rancher server is running!"
    echo
    echo "  1.) add lines bellow to your /etc/hosts:"
    echo "      # rancher nodes"
    echo "      192.168.1.240 rancher.local"
    echo "      192.168.1.241 k8s-master-a.local"
    echo "      192.168.1.251 k8s-worker-1.local"
    echo "      192.168.1.252 k8s-worker-2.local"
    echo "      192.168.1.253 k8s-worker-3.local"
    echo 
    echo "  2.) access rancher server in your browser:"
    echo "      https://rancher.local/"
    echo
    echo "  3.) use the initial password:"

    #
    # Wait for first rancher password
    #
    __matched=1
    while [ "$__matched" == "1" ];
    do
        docker logs rancher 2>&1 | grep "Bootstrap Password:";
        __matched=$?;
        sleep 0.2
    done
}

install_rancher_single_node && helper_instructions
