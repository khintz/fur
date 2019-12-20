#!/bin/bash
source env.sh
NAME=harpdev # Name of the new image build on top of the parent image

#Build the Image
docker build -t $NAME .

#Stop any previous containers with this name before running
docker stop $NAME
docker rm $NAME

#Run the image in container
docker run -d --name $NAME $NAME

#Send STDOUT from container
docker logs -f $NAME > docker.log
