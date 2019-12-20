
# FUR
FU-NWP container environment for development using R and HARP
For HARP references see: https://github.com/andrew-MET/harp

# Install
First install the parent image. This image is precompiled with R and HARP with all the dependencies. From the parent image we build a new image which is used to run our source code in. To get the parent image do:

**1. `docker pull khintz/harp:testing`**
If interested the code for building the parent image is in the directory `image_src`.

Within the `fur` directory do:
**2. `bash deploy.sh`**

This will build and run your local image. You can use this to run everything even when your source code has changed. It wont rebuild unless necessary. *The first time this runs it have to download the parent image.*

When running the deploy script, `deploy.sh`, it will copy all the code within `src` and run the `main.R` script as `Rscript main.R`.
From here the development and funny things starts.

If you want to do it yourself step-by-step then see build and run below.

## Build
**1. `docker build -t harpdev .`**

## Run
**1. `docker run -d --name NameForContainer harpdev`**

# Troubleshooting
If for some reason the image fails to build and returns a 404 error code, then add "--no-cache" to the Docker build file in deploy.sh. This forces the image to be build from scratch.

# "Help me! I am new to docker"-section
Get a list of all containers:
```
docker container ls -a
```
To remove a container
```
docker container rm CONTAINERID
```
To remove all stopped containers
```
docker rm $(docker ps --filter=status=exited --filter=status=created -q)
```

To get a list of all images
```
docker images
```
To remove an image
```
docker image rm IMAGEID
```
Dangling images can be removed with
```
docker rmi $(docker images -a --filter=dangling=true -q)
```
Remove all dangling images
```
docker image prune -a
```
Brute force clean images
```
docker rmi $(docker images -a)
```
