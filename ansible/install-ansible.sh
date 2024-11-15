#!/bin/bash -ex

sudo su -

groupadd -g 15000 developers

useradd -m -u 55000 -G developers app-user
echo "pass-app" | sudo passwd --stdin app-user
echo "app-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m -u 55002 -G developers dev1-user
echo "pass-dev1" | sudo passwd --stdin dev1-user
echo "dev1-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

yum update -y
yum install ansible -y

sed -ie 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd reload                   # systemctl restart sshd


