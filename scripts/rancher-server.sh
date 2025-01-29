# install rancher single node
sudo docker run -d \
    --name rancher \
    --restart=unless-stopped \
    -v /opt/rancher:/var/lib/rancher \
    -p 80:80 \
    -p 443:443 \
    --privileged \
    rancher/rancher:stable

echo $(docker logs rancher 2>&1 | grep "Bootstrap Password:")