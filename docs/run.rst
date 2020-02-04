==================
Build and Run
==================

------------
Build
------------
Within the fur directory do:

* **bash deploy.sh**

This will build your local image and run the container afterwards.
You can use this to run everything even when your source code has changed.
It won't rebuild unless necessary.

The first time this runs it has to download the parent image, if you have not
installed it manually with the *docker build* command.

If you change your source code, make sure to build your local image before
running the container. Using the *deploy.sh* script is a safe way to be sure of this.

When running the deploy script, *deploy.sh*, it will copy all the code
within *src* and run the *main.R* script as *Rscript main.R*.
From here the development and funny things starts.

------------
Run
------------
To run your container based on your local image you have to options:

* **docker run -dit --name <containername> -v $FURHOME/container-data:/data <imagename>**
* **bash run_container.sh**

The script *run_container.sh* does everything for you, by making sure old containers
are stopped and removed before starting a new one. A list of variables in the command line is given below.

* **$FURHOME**: the path to the main *fur* directory
* **<containername>**: The name of the container. Can be whatever.
* **<imagename>**: The name of the image the container should use. This *must* match the name from the build phase. By default we have named the image *harpdev*.

The -v argument binds a local data directory ($FURHOME/container-data) to the
container. The container then accesses the data in */data*. We recommend to
not change the directory name in the container but the local directory can be
whatever. For example, a directory where all your data is which you want
to read from the container.

*If you change your source code, make sure to build your image again.*
