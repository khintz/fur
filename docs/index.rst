fur documentation
===============================

  .. toctree::
     :maxdepth: 1
     :hidden:

     install
     run
     docker

=====
fur
=====
*fur* is an example of how HARP can be run in a Docker **container**.
HARP is a verification toolbox mainly for numerical weather prediction,
written in R. For HARP references see the `HARP GitHub repo <https://github.com/andrew-MET/harp>`_.

*fur* has been developed by the NWP group at the Danish Meteorological Institute (DMI).

what problem does it solve?
-------------------------------
HARP is written in R and have multiple R-package dependencies. Dealing with R
packages can be a nightmare across platforms. Breaking changes is not a rare
phenomenon and so compiling and installing HARP and share code across
collaborations is not failsafe.

*fur* is a Docker image which contains a frozen installation of HARP and R.
This makes the environment independent from the official HARP repository which gets
commits directly onto the master-branch. From the *fur* image one can develop and
run code that has HARP as a dependency and share that with other users of *fur*
without having to deal with R environments.

.. image:: https://github.com/khintz/fur/raw/master/image_src/fur.jpg
