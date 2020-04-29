#!/bin/bash
PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:~/bin
export PATH
c=$(ps -ef | grep "java -jar agent.jar"|grep -v grep | wc -l)
if [ $c -eq 0 ];then
  systemctl stop jenkins-slave
  sleep 2s
  systemctl start jenkins-slave
  echo "Finished restarting service jenkins-slave"
fi
