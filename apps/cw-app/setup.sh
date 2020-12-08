#!/bin/bash
printf "\n..CW App Setup.."
printf "\n..Make sure you're already logged into Docker Hub via Docker login..\n\n"

username=""

read -p "Enter your Docker Hub username: "
username=$REPLY

printf "\n..Building v1.0..\n"
docker build ./v1.0/ -t $username/cw-app:1.0

printf "\n..Building v2.0..\n"
docker build ./v2.0/ -t $username/cw-app:2.0

printf "\n..Building v2.1..\n"
docker build ./v2.1/ -t $username/cw-app:2.1

printf "\n..Pushing Images to Docker Hub..\n"
docker push $username/cw-app:1.0
docker push $username/cw-app:2.0
docker push $username/cw-app:2.1

printf "\n...Done...\n"
