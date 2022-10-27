#!/bin/bash

## Author: Nsimba Z.
## Date: 10/27/2022

##....installation of jenkins on a centOS 7 machine...

echo "starting Jenkins installation this will take a few min..."

sudo yum install java-11-openjdk-devel -y
sudo curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
sudo sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload

echo "Jenkins is ready please get ip and type it on your browser"

