#!/bin/bash
sudo yum update –y
# Install OpenJDK 8
sudo yum install jenkins java-1.8.0-openjdk-devel -y
# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo amazon-linux-extras install epel -y

sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
