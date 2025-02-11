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

## Startup rancher-server

## Create cluster

## Register nodes



### Registring node: k8s-master-a
#### Registration -> Step 1

- Node role: [**X**] **etcd**, [**X**] **Control Plane**, [**X**] **Worker**

#### Registration -> Step 2

- Node Name: (empty)
- Node Public IP: 192.168.0.241
- Node Private IP: 192.168.0.241

#### Registration -> Step 3

- Registration Command
[**copy:** sudo docker command] 

```sh
vagrant ssh k8s-master-a
[**paste:** sudo docker command]
```

### Registring node: k8s-worker-1
#### Registration -> Step 1
- Node role: [ ] etcd, [ ] Control Plane, [**X**] **Worker**

#### Registration -> Step 2

- Node Name: (empty)
- Node Public IP: 192.168.0.251
- Node Private IP: 192.168.0.251

#### Registration -> Step 3

- Registration Command
[**copy:** sudo docker command] 

```sh
vagrant ssh k8s-worker-2
```

[**paste:** sudo docker command]

### Registring node: k8s-worker-2
#### Registration -> Step 1
- Node role: [ ] etcd, [ ] Control Plane, [**X**] **Worker**

#### Registration -> Step 2

- Node Name: (empty)
- Node Public IP: 192.168.0.252
- Node Private IP: 192.168.0.252

#### Registration -> Step 3

- Registration Command
[**copy:** sudo docker command] 

```sh
vagrant ssh k8s-worker-2
```

[**paste:** sudo docker command]

### Registring node: k8s-worker-3
#### Registration -> Step 1
- Node role: [ ] etcd, [ ] Control Plane, [**X**] **Worker**

#### Registration -> Step 2

- Node Name: (empty)
- Node Public IP: 192.168.0.253
- Node Private IP: 192.168.0.253

#### Registration -> Step 3

- Registration Command
[**copy:** sudo docker command] 

```sh
vagrant ssh k8s-worker-2
```

[**paste:** sudo docker command]