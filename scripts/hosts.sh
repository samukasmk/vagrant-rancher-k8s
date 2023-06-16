#!/bin/bash
# insert ip of rancher and kubernets farm

echo "

# rancher farm
192.168.1.100 rancher rancher.local
192.168.1.101 k8s-1 k8s-1.local
192.168.1.102 k8s-2 k8s-2.local
192.168.1.103 k8s-3 k8s-3.local
" >> /etc/hosts