#!/bin/bash
paths=(
#/spkshare1/vagrant/k8s/master1
/spkshare1/vagrant/k8s/node
)
for pathName in ${paths[@]} ; do
    { 
    cd $pathName
    vagrant reload --no-tty
    for node in node{1..3};do
        vagrant ssh $node -c "sudo route add default gw 10.50.10.254 eth1 &&
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && 
        sudo systemctl restart sshd ";
    done
    }
done
