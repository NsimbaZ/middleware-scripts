#!/bin/bash

#Author: Nsimba Z.
#Date: 10/29/2022

##...This script installs Docker on a CentOS 7 machine....

#Uninstall old versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

#Set up the repository
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#Install the latest version of Docker Engine
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Start Docker
sudo systemctl start docker

#Verify that Docker Engine is installed correctly
sudo docker run hello-world
