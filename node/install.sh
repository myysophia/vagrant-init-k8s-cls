#!/usr/bin/env bash

# yum net-tools & udate route
cd /tmp &&  curl -O 10.50.10.25/pigsty/net-tools-2.0-0.25.20131004git.el7.x86_64.rpm 
yum -y install net-tools-2.0-0.25.20131004git.el7.x86_64.rpm
route add default gw 10.50.10.254 eth1
route -n
# modify ssh parpmeter passwd=yes
sed -ri '/^PasswordAuthentication/cPasswordAuthentication yes' /etc/ssh/sshd_config
systemctl restart sshd
# change time zone
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
timedatectl set-timezone Asia/Shanghai
rm /etc/yum.repos.d/CentOS-Base.repo
curl 10.50.10.25/pigsty/Centos-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo
# install  kmod and ceph-common for rook
yum install -y wget curl conntrack-tools vim net-tools telnet tcpdump bind-utils socat ntp kmod  dos2unix

echo 'disable selinux'
setenforce 0
sed -i 's/=enforcing/=disabled/g' /etc/selinux/config

echo 'enable iptable kernel parameter'
cat >> /etc/sysctl.conf <<EOF
net.ipv4.ip_forward=1
EOF
sysctl -p


echo 'set host name resolution'
cat >> /etc/hosts <<EOF
10.50.10.31 master1
10.50.10.32 master1
10.50.10.33 master1
10.50.10.34 node1
10.50.10.35 node1
10.50.10.36 node1
EOF

cat /etc/hosts


echo 'disable swap'
swapoff -a
sed -i '/swap/s/^/#/' /etc/fstab

#install docker
yum -y install docker-ce.x86_64
systemctl daemon-reload && systemctl enable --now docker

# download kernel
cd /tmp && curl -O http://10.50.10.25/pigsty/kernel-lt-5.4.200-1.el7.elrepo.x86_64.rpm && rpm -Uvh kernel-lt-5.4.200-1.el7.elrepo.x86_64.rpm 

