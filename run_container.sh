#!/bin/bash
source env.sh
IMAGE=harpdev
NAME=harprun # Name of the new image build on top of the parent image

# #Stop any previous containers with this name before running
docker stop $NAME
docker rm $NAME

#Run the image in container
docker run -dit -P --name $NAME -v $FURHOME/container-data:/data $IMAGE

#Send STDOUT from container
docker logs -f $NAME > docker.log
