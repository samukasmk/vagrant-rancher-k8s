#!/bin/bash
# insert ip of rancher and kubernets farm

echo "

# rancher farm
192.168.1.200 rancher rancher.local
192.168.1.201 k8s-1 k8s-1.local
192.168.1.202 k8s-2 k8s-2.local
192.168.1.203 k8s-3 k8s-3.local
" >> /etc/hosts