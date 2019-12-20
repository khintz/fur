FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install cmake wget gfortran libcurl4-openssl-dev libssl-dev
RUN apt-get -y install software-properties-common gtk-doc-tools libfontconfig1-dev
RUN apt-get -y install libcairo2-dev libgdal-dev libssh2-1-dev libxml2-dev

# HDF5
RUN apt-get -y install libhdf5-serial-dev

# NetCDF4
RUN apt-get -y install libnetcdf-dev netcdf-bin libudunits2-dev

# ECCODES
RUN wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.13.1-Source.tar.gz
RUN tar -xzf eccodes-2.13.1-Source.tar.gz
ARG ECCODES_DIR=/usr/local
RUN mkdir ecbuild && cd ecbuild && cmake -DCMAKE_INSTALL_PREFIX=$ECCODES_DIR ../eccodes-2.13.1-Source && make && make install

# R
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | apt-key add -
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/"
# To show avail repos: https://askubuntu.com/questions/218708/installing-latest-version-of-r-base
#RUN apt-cache showpkg r-base
RUN add-apt-repository ppa:marutter/rdev
RUN apt-get update
RUN apt-get install -y r-base=3.6.2-1bionic

RUN R -e "install.packages('devtools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggplot2',dependencies=TRUE, repos='http://cran.rstudio.com/')"

COPY install_harp.R /
COPY test_harp.R /

#CMD ["Rscript", "install_harp.R"]
RUN R -e "devtools::install_github('andrew-MET/harp')"
CMD ["Rscript", "test_harp.R"]
