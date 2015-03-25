#!/bin/bash
echo "Build and Deploy script"

# Detect hdp version
if ls /usr/hdp | grep --quiet '2.2'; then
    echo 'HDP 2.2 detected'

    # Copy flume sources(jar files) to flume lib
    cp /vagrant/sources/*/target/*.jar /usr/hdp/current/flume-server/lib/

    # Copy config file
    cp /vagrant/sources/*/*.conf /etc/flume/conf/
else
    echo 'Not 2.2, or HDP not installed, exit'
    exit 1
fi
