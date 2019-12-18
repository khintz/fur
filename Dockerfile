FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install build-essential cmake wget

# gfortran
RUN apt-get -y install gfortran
# HDF5
RUN apt-get -y install libhdf5-serial-dev
# NetCDF4
RUN apt-get -y install libnetcdf-dev



#RUN wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.13.1-Source.tar.gz
#RUN tar -xzf eccodes-2.13.1-Source.tar.gz
#ARG ECCODES_DIR=/usr/local
#RUN mkdir ecbuild && cd ecbuild && cmake -DCMAKE_INSTALL_PREFIX=$ECCODES_DIR ../eccodes-2.13.1-Source && make && make install


#
# WORKDIR /kfapp
# COPY . /kfapp
#
# #RUN make
#
CMD echo "hi (and farewell)"
