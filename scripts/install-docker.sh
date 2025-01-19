# disable swap
sudo swapoff -a

# update apt repos
sudo apt update -y

# install vbox guest
sudo apt install -y virtualbox-guest-additions-iso

# install certificates
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# install docker repo
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update apt repos
sudo apt update -y

# install packages
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# enable docker without sudo
# sudo groupadd docker
sudo usermod -aG docker ubuntu
sudo usermod -aG docker vagrant