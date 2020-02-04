========================================================
Docker quickstart
========================================================

"Help me! I am new to docker"-section
"""""""""""""""""""""""""""""""""""""""
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
