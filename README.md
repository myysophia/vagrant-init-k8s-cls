# vagrant-init-k8s-cls
init k8s cls by vagrant

## 说明

- 私有云自建
- 无外网完成部署

Vagrant&&virtualBox 二进制部署高可用k8s集群，该项目是业余使用公司闲置机器，借助virtualBox、vagrant等虚拟化手段<font color='red'>快速搭建k8s集群</font>。部分业务已经部署到K8s上。

## 安装vagrant 和virtualbox

```bash
yum -y install virtualbox vagrant 
```

选择centos/7 box。

##  修改Vagrantfile

1、Vagrantfile中的ip地址、资源分配请根据实际情况酌情修改.

2、Vagrantfile完成的工作包括

- 安装必要软件，例如wget curl conntrack-tools vim net-tools telnet tcpdump bind-utils socat ntp kmod  dos2unix
- 完成集群免密登录
- 升级centos内核
- 安装K8s内核参数调优
- 安装docker、etcd、kubernetes-server

以上完成的内容详见install.sh

## issue

1、由于是我的环境是内网部署，因此需要设置指定网关，对应reload-k8s-cls.sh

## 实战参考

- https://blog.csdn.net/MyySophia/article/details/118863866?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522166434285116800180632943%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=166434285116800180632943&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-2-118863866-null-null.nonecase&utm_term=virtualbox&spm=1018.2226.3001.4450

- https://blog.csdn.net/MyySophia/article/details/126951960?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522166434285116800180632943%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=166434285116800180632943&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-1-126951960-null-null.nonecase&utm_term=virtualbox&spm=1018.2226.3001.4450