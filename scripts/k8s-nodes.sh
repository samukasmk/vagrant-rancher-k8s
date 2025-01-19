docker run -d \
  --privileged \
  --restart=unless-stopped \
  --net=host \
  -v /etc/kubernetes:/etc/kubernetes \
  -v /var/run:/var/run \
  rancher/rancher-agent:v2.7.4 \
  --server https://rancher.local \
  --label 'cattle.io/os=linux' \
  --token 'g5t5tfgv8bhcjczjxv5r4jd8sd8g8jl7zm9ztd7hk2pxp2sk4j2jb4' \
  --ca-checksum 'a1b43ed76b9dcaa647631b583d036c3e5b777f0e7c071ba6518041a792d72daf' \
  --etcd \
  --controlplane \
  --worker