#!/bin/bash

set -e

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
echo y | yum --enablerepo=elrepo-kernel install kernel-lt
sed -i 's/saved/0/1g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot
