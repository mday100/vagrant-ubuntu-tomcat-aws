#!/bin/bash

sudo apt-get update

sudo apt-get -y install default-jdk

sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

wget http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz
sudo mkdir /opt/tomcat
sudo tar xvf apache-tomcat-8.0.32.tar.gz -C /opt/tomcat --strip-components=1

cd /opt/tomcat
sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*
sudo chown -R tomcat work/ temp/ logs/

sudo chmod g+rw /etc/init/