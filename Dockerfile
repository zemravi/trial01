FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

MAINTAINER Ravi Kiran Kummamuru <rkummamu@gmail.com>

ARG ANACONDA_VERSION=5.0.0.1
ARG TENSORFLOW_VERSION=1.3.0
ARG TENSORFLOW_ARCH=gpu
ARG KERAS_VERSION=2.0.8

ENV ANACONDA_DIR /opt/anaconda
ENV PATH $ANACONDA_DIR/bin:$PATH

# Download anaconda and install it
RUN apt-get update && apt-get install -y wget build-essential
RUN wget http://repo.continuum.io/archive/Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh -P /tmp
RUN bash /tmp/Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p $ANACONDA_DIR
RUN rm /tmp/Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh

# Install TensorFlow
RUN pip --no-cache-dir install	https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_ARCH}/tensorflow_${TENSORFLOW_ARCH}-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl

# Install keras
RUN pip install keras==${KERAS_VERSION}
