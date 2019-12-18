#!/bin/bash
NAME=funwp-fur
docker build --no-cache -t $NAME .
docker stop $NAME
docker rm $NAME
docker run -d --restart=always --name $NAME $NAME
