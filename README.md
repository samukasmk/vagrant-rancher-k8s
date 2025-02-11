# vagrant-rancher-k8s
A provisioning project to run Kubernets cluster with Rancher, Docker in VirtualBox machines with Vagrant automation

## Install requirements
Install the requirements below
- [virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [vagrant](https://developer.hashicorp.com/vagrant/docs/installation)

## Create virtual machines

```
git clone https://github.com/samukasmk/vagrant-rancher-k8s.git

```

## Provisioning machines

### rancher-server
```
cd vagrant-rancher-k8s
make rancher
```

### kubernets master (a)
```
cd vagrant-rancher-k8s
make k8s-master-a
```

### kubernets worker (1)
```
cd vagrant-rancher-k8s
make k8s-worker-1
```

### kubernets worker (2)
```
cd vagrant-rancher-k8s
make k8s-worker-2
```

### kubernets worker (3)
```
cd vagrant-rancher-k8s
make k8s-worker-3
```