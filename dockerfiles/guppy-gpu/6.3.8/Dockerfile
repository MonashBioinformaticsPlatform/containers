# docker build -t guppy-gpu:6.3.8 .
# singularity build guppy-gpu_6.3.8.sif docker-daemon://guppy-gpu:6.3.8

FROM nvidia/cuda:11.8.0-base-ubuntu20.04

# MAINTAINER Laurent Jourdren <jourdren@biologie.ens.fr>
# Thankyou Laurent !
MAINTAINER Andrew Perry <Andrew.Perry@monash.edu>

ARG PACKAGE_VERSION=6.3.8
ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install --yes $BUILD_PACKAGES libnvidia-compute-515-server libpgm-5.2-0 libnorm1 libzmq5 && \ 
    cd /tmp && \
    wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_${PACKAGE_VERSION}-1~focal_amd64.deb && \
    apt install --yes /tmp/ont_guppy_${PACKAGE_VERSION}-1~focal_amd64.deb && \
    rm *.deb && \
    apt-get autoremove --purge --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

