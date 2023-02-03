#!/bin/bash
#Script created to up docker container from jenkins

docker run -d --name=jenkins -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker jenkins/jenkins:lts-jdk11

docker exec -u root jenkins chmod 666 /var/run/docker.sock

docker exec -i jenkins docker ps