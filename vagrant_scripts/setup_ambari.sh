#!/bin/bash
# This script setups vm and ambari in order to then use ambari web-ui
# for installing hadoop components.
# More info here: http://hortonworks.com/blog/building-hadoop-vm-quickly-ambari-vagrant/

# --- VM SETUP ---

# Update hosts with hostname
cp /vagrant/vagrant_config/hosts /etc/hosts

# Install ntp, wget and start ntp
yum -y install ntp
yum -y install wget
chkconfig ntpd on
service ntpd start


# --- AMBARI SETUP ---

# Get ambari repo
wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo
cp ambari.repo /etc/yum.repos.d

# Install ambari-server
yum -y install ambari-server

# Ambari default setup
ambari-server setup -s

# Start Ambari
ambari-server start





