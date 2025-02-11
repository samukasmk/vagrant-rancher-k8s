.PHONY: help up destroy rancher k8s k8s-1 k8s-2 k8s-3 u d r k1 k2 k3

help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

u: up

up:
	@echo "rancher\nk8s-1\nk8s-2\nk8s-3\n" | xargs -n1 -P6 vagrant up

d: destroy

destroy:
	@vagrant destroy

dn: destroy

destroy-nodes:
	@echo "k8s-master-1\nk8s-worker-a\nk8s-worker-b\nk8s-worker-c\n" | xargs -n1 -P6 vagrant destroy

r: rancher

rancher:
	@vagrant up rancher && vagrant ssh rancher -c 'sudo su'

k: k8s-nodes
k8s-nodes:
	@echo "k8s-master-1\nk8s-worker-a\nk8s-worker-b\nk8s-worker-c\n" | xargs -n1 -P6 vagrant up

km1: k8s-master-1
k8s-master-1:
	@vagrant up k8s-master-1 && vagrant ssh k8s-master-1 -c 'sudo su'

kw1: k8s-worker-a
k8s-worker-a:
	@vagrant up k8s-worker-a && vagrant ssh k8s-worker-a -c 'sudo su'

kw2: k8s-worker-b
k8s-worker-b:
	@vagrant up k8s-worker-b && vagrant ssh k8s-worker-b -c 'sudo su'

kw3: k8s-worker-c
k8s-worker-c:
	@vagrant up k8s-worker-c && vagrant ssh k8s-worker-c -c 'sudo su'
