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
    vagrant halt
    }
done
