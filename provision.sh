#!/bin/bash

sudo apt-get update

#Get and Install Java and Tomcat
sudo apt-get -y install default-jdk
wget http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz
sudo mkdir /opt/tomcat
sudo tar xvf apache-tomcat-8.0.32.tar.gz -C /opt/tomcat --strip-components=1

#Setup for Tomcat Dashboard
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /opt/tomcat
sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*
sudo chown -R tomcat work/ temp/ logs/

#Get and Install Oracle Database Drivers
sudo chmod 777 /opt/tomcat/lib/
wget http://www.webdreams.co/ojdbc7.jar
sudo mv ojdbc7.jar /opt/tomcat/lib/

#Initialize Tomcat Server on Start
sudo chmod 777 /etc/init
wget http://www.webdreams.co/tomcat.conf
sudo mv tomcat.conf /etc/init
sudo initctl reload-configuration
sudo initctl start tomcat