FROM i386/ubuntu:16.04 
LABEL maintainer="Udayanga Wickramasinghe <mastershield2007@gmail.com>"

#############################
# Install Packaged Software #
#############################

WORKDIR /home
# Software for all autograding images
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    gdb \
    qemu \
    libcr-dev \
    mpich \
    make \
    python \
    python-pip \
    vim \
    git \
    gawk\
 && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
 #&& gcc /autodriver.c -o /usr/bin/autodriver \
 #&& chmod +x /build_toolchain.sh && /build_toolchain.sh && pip install simplejson && rm -rf /var/lib/apt/lists/* \

# OpenMPI installation
 #libopenmpi-dev openmpi-bin libhdf5-openmpi-dev 

ADD ./ /home/xv6

RUN cd /home/xv6 

#####################
# Environment Setup #
#####################


ENV MALLOC_PERTURB_=
ENV GIT_SSL_NO_VERIFY=1
