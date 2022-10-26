#!/bin/bash

##...This script installs and configures SonarQube on a centOS 7 machine....

# Author: Nsimba Zebedi
# Date: 10/26/2022

##--> Step 1: check if user logged in is vagrant

my_user=`whoami`

if [ $my_user != vagrant ]
then
echo "please ensure user is vagrant before running script."
exit 1

else # run installation if user is vagrant

##--> Step 2: Java 11 installation

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

##--> Step 3: Download SonarQube latest versions on your server

cd /opt
sudo yum install wget unzip -y # install wget and unzip in case they're not installed on system
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

##--> Step 4: Extract packages

sudo unzip /opt/sonarqube-9.3.0.51899.zip

##--> Step 5: Change ownership to the user and Switch to Linux binaries directory to start service

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899
cd bin/linux-x86-64
./sonar.sh start

# open port 9000 through firewall in case port is not enabled

sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

fi # end of if-statement to check for user vagrant and complete installation
