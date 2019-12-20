#!/bin/bash
source ../env.sh
NAME=funwp-fur
#Build the Image
docker build -t $NAME .

#Stop any previous containers with this name before running
docker stop $NAME
docker rm $NAME

#Run the image in container
docker run -d --name $NAME $NAME
#docker run -d --name container_name image_name
#Send STDOUT from container
docker logs -f $NAME > docker.log
