==================
Installation
==================

------------
Requirements
------------
Since the main objective of this project is to avoid dealing with the nightmare of dealing with R packages,
there is not a lot of requirements.

* Docker >= 2.2.0.0
* Linux environment / MacOS. This has not been tested on Windows.

------------
Installation
------------
Inside the *fur* directory do:

* **docker build -t <*imagename*> .**

Here <*imagename*> is your desired name for your local image, e.g. 'harpimage'.
This will pull and build the parent image that contains HARP and R.
A local image is being created on your machine from which you can run your code
inside a container. Note that you skip this and just run **bash deploy.sh**,
which does everything for you.

The *docker build* commands follows a "recipe" defined by the *Dockerfile* in the directory.
