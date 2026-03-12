#!/bin/bash

IMAGE_NAME=$1
TAG=$2

docker pull $IMAGE_NAME:$TAG

docker stop react-devops-app || true
docker rm react-devops-app || true

docker run -d \
--name react-devops-app \
-p 80:80 \
$IMAGE_NAME:$TAG