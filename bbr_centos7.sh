#!/usr/bin/env bash
#
# Auto install latest Linux kernel and enable TCP BBR
#
# System Required:  CentOS 7 x86_64
#
# Author:  Shuokang the Great
#
## Upgrade the kernel using the ELRepo RPM repository
#  Install the ELRepo repository
rpm --import "https://www.elrepo.org/RPM-GPG-KEY-elrepo.org"
rpm -Uvh "http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm"
#  Install the latest kernel
yum --enablerepo=elrepo-kernel -y install kernel-ml
#  Set up the default grub2 boot entry
grub2-set-default 1
#
## Enable BBR
#  Modify the sysctl configuration
echo "net.core.default_qdisc=fq" | tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | tee -a /etc/sysctl.conf
sysctl -p
#
## Reboot
read -p "Reboot now to finish installation? [y/n]" restart
if [[ ${restart} == "y" || ${restart} == "Y" ]]; then
    reboot
else
    exit
fi
