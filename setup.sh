#!/bin/sh
#
cp jenkins-slave.conf /etc/sysconfig/jenkins-slave
cp jenkins-slave.init /etc/init.d/jenkins-slave
chmod 770 /etc/init.d/jenkins-slave
chkconfig --add jenkins-slave
chkconfig --level 3 jenkins-slave on
sleep 5s
systemctl restart jenkins-slave
chmod 644 monitor-jenkins
cp monitor-jenkins /etc/cron.d/
systemctl restart crond
