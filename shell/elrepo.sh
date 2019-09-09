#!/bin/bash

set -e

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install –y kernel-lt
sed -i 's/saved/0/1g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot