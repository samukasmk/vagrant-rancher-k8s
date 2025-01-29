sudo docker run -d \
  --privileged \
  --restart=unless-stopped \
  --net=host \
  --ip <container-ip> \
  -v /etc/kubernetes:/etc/kubernetes \
  -v /var/run:/var/run \
  rancher/rancher-agent:v2.10.1 \
  --server https://rancher.local \
  --token <token> \
  --ca-checksum <ca-checksum> \
  --etcd \
  --controlplane \
  --worker \
  --node-name k8s-1 \
  --internal-address 192.168.1.201
