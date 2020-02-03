#!/bin/bash
source env.sh
IMAGE=harpdev
NAME=harprun # Name of the new image build on top of the parent image

#Build the Image
docker build -t $IMAGE .

#Stop any previous containers with this name before running
docker stop $NAME
docker rm $NAME

#Run the image in container
#docker run -d --name $NAME $NAME
docker run -dit -P --name $NAME -v $FURHOME/container-data:/data $IMAGE

#-v $FURHOME/container-data:/data specifies your local data to the binded volume inside the container.
# $FURHOME/container-data is your local data (make your choice)
# /data is the directory name inside the container.
# We recommend to keep the name of "/data"

#Send STDOUT from container
docker logs -f $NAME > docker.log
