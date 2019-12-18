# FUR

FU-NWP container environment for development using R

# Install
If for some reason the image fails to build and returns a 404 error code, then add "--no-cache" to the Docker build file in deploy.sh
This forces the image to be build from scratch.

# Deploy

# Run

# HELP I AM NEW TO DOCKER Section
Get a list of all containers:
  docker container ls -a
To remove a container
  docker container rm CONTAINERID
To remove all stopped containers
  docker container prune

To get a list of all images
  docker image ls
To remove an image
  docker image rm IMAGEID
Dangling images can be removed with
  docker image prune
Remove all dangling images
  docker image prune -a
