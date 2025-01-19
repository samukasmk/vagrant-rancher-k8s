.PHONY: help clean test test-cov

help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up:
	@echo "rancher\nk8s-1\nk8s-2\nk8s-3\n" | xargs -n1 -P6 vagrant up

destroy:
	@vagrant destroy

rancher:
	@vagrant up rancher && vagrant ssh rancher -c 'docker logs rancher 2>&1 | grep "Bootstrap Password:"' && vagrant ssh rancher -c 'sudo su'

k8s:
	@echo "k8s-1\nk8s-2\nk8s-3\n" | xargs -n1 -P6 vagrant up

k8s-1:
	@vagrant up k8s-1 && vagrant ssh k8s-1 -c 'sudo su'

k8s-2:
	@vagrant up k8s-2 && vagrant ssh k8s-2 -c 'sudo su'

k8s-3:
	@vagrant up k8s-3 && vagrant ssh k8s-3 -c 'sudo su'
