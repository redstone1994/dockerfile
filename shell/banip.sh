#!/bin/bash

#参看
#https://www.cyberciti.biz/faq/how-to-block-an-ip-address-with-ufw-on-ubuntu-linux-server/

# 获取列表
iplist=$(/bin/lastb -n30|awk '{print $3}'|sort|uniq -c|awk '{if ($1>3) print $2}')
# 追加到黑名单并清空登录日志
for ip in ${iplist}
do
#       echo ALL: ${ip} >> /etc/hosts.deny
#       echo > /var/log/btmp
#ufw deny from ${ip}
/usr/sbin/ufw insert 1 deny from ${ip} comment 'block spammer'
done
