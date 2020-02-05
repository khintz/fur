#!/bin/bash
source env.sh
IMAGENAME=harpdev
CONTAINERNAME=harprun # Name of the container based on IMAGENAME

#Build the Image
#docker build -t $IMAGENAME .
docker build --build-arg PID=$PID --build-arg GID=$GID -t $IMAGENAME .

#Stop any previous containers with this name before running
if [ ! "$(docker ps -q -f name=$CONTAINERNAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$CONTAINERNAME)" ]; then
        # cleanup
        echo "Removing container $CONTAINERNAME"
        docker rm $CONTAINERNAME
    fi
else
    docker stop $CONTAINERNAME
    docker rm $CONTAINERNAME
fi


#Run the image in container
#docker run -d --name $CONTAINERNAME $CONTAINERNAME
docker run -dit -P --name $CONTAINERNAME -v $FURHOME/container-data:/data $IMAGENAME

#-v $FURHOME/container-data:/data specifies your local data to the binded volume inside the container.
# $FURHOME/container-data is your local data (make your choice)
# /data is the directory name inside the container.
# We recommend to keep the name of "/data"

#Send STDOUT from container
docker logs -f $CONTAINERNAME > docker.log
