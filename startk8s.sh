#!/bin/bash
paths=(
/gpmaster/gpseg-1_down/k8s/k8s-master1
/gpmaster/gpseg-1_down/k8s/k8s-master2
/gpmaster/gpseg-1_down/k8s/k8s-master3
/gpmaster/gpseg-1_down/k8s/k8s-node1
/gpmaster/gpseg-1_down/k8s/k8s-node2
/gpmaster/gpseg-1_down/k8s/k8s-node3
)
for pathName in ${paths[@]} ; do
    { 
    cd $pathName
    vagrant reload --no-tty
    vagrant ssh -c "
    sudo route add default gw 10.50.10.254 eth1" 
    }
done
