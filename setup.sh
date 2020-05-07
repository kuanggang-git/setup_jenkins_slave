#!/bin/sh
#
cp jenkins-slave.conf /etc/sysconfig/jenkins-slave
cp jenkins-slave.init /etc/init.d/jenkins-slave
chmod 770 /etc/init.d/jenkins-slave
chkconfig --add jenkins-slave
chkconfig jenkins-slave on
sleep 5s
/etc/init.d/jenkins-slave start
chmod 644 monitor-jenkins
cp monitor-jenkins /etc/cron.d/
[ -f /usr/sbin/crond ] && systemctl restart crond
[ -f /usr/sbin/cron ] && systemctl restart cron
