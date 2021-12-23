#!/bin/bash

#Login warning banner
sed -i 's+#Banner none+Banner /etc/ssh/login.warn+g' /etc/ssh/sshd_config
mv /tmp/login.warn /etc/ssh/login.warn
#Disable no password logins
sed -i 's+#PermitEmptyPasswords no+PermitEmptyPasswords no+g' /etc/ssh/sshd_config

#cron to patch


apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y


rm -f host_prep.sh 
