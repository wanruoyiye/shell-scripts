#!/bin/bash
#fenfa ssh_keygen

. /etc/rc.d/init.d/functions
rm -f /root/.ssh/id_rsa*
ssh-keygen -t rsa -f /root/.ssh/id_rsa -N '' -q

for ip in 21 22
do 
  sshpass -p "123456" ssh-copy-id   root@192.168.231.${ip} -o StrictHostKeyChecking=no &> /dev/null
  if [ $? -eq 0 ];then
    action "fenfa 192.168.231.${ip}" /bin/true
  else 
    action "fenfa 192.168.231.${ip}" /bin/false
  fi
  echo ""
done

