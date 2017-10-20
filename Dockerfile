FROM continuumio/anaconda:5.0.0
MAINTAINER ravikiran.kummamuru@zemosolabs.com

ARG TENSORFLOW_VERSION=1.3.0
ARG KERAS_VERSION=2.0.0-py27_0

RUN conda install tensorflow
RUN conda install keras
RUN conda install boto3
RUN conda install git

ENV PATH="home/docs/docker_related/env:${PATH}"
RUN pip install home/docs/projects/stt/deepspeech/deepspeech-0.0.1-cp27-cp27mu-linux_x86_64.whl
