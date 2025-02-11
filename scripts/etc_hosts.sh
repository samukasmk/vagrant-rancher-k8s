#!/bin/bash
# insert ip of rancher and kubernets farm

echo "

# rancher nodes
192.168.0.240 rancher      rancher.local
192.168.0.241 k8s-master-1 k8s-master-1.local
192.168.0.251 k8s-worker-a k8s-worker-a.local
192.168.0.252 k8s-worker-b k8s-worker-b.local
192.168.0.253 k8s-worker-c k8s-worker-c.local

" >> /etc/hosts