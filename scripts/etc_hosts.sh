#!/bin/bash
# insert ip of rancher and kubernets farm

echo "

# rancher nodes
192.168.0.240 rancher      rancher.local
192.168.0.241 k8s-master-a k8s-master-a.local
192.168.0.251 k8s-worker-1 k8s-worker-1.local
192.168.0.252 k8s-worker-2 k8s-worker-2.local
192.168.0.253 k8s-worker-3 k8s-worker-3.local

" >> /etc/hosts