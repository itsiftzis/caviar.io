#!/bin/bash
# This script setups vm and ambari in order to then use ambari web-ui
# for installing hadoop components.
# More info here: http://hortonworks.com/blog/building-hadoop-vm-quickly-ambari-vagrant/

# --- VM SETUP ---
echo 'Installing ambari...'

# Update hosts with hostname
cp /vagrant/vagrant_config/hosts /etc/hosts

# Install ntp, wget and start ntp
yum -y install ntp
yum -y install wget
chkconfig ntpd on
service ntpd start


# SSH keys
sudo su
cd ~

mkdir .ssh
chmod 0700 .ssh
ssh-keygen -t rsa -N "" -f .ssh/id_rsa
cp .ssh/id_rsa /vagrant/
cat .ssh/id_rsa.pub >> .ssh/authorized_keys

# --- AMBARI SETUP ---

# Get ambari repo
wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo
cp ambari.repo /etc/yum.repos.d

# Install ambari-server
yum -y install ambari-server

# Ambari default setup
ambari-server setup -s

# Start Ambari
ambari-server start

echo 'Ambari server is ready!'





