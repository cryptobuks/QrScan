# Docker image for installing dependencies on Linux and running tests.
# Build with:
#   docker build --tag=qrscan .
# Run with:
#   docker run qrscan /bin/sh -c 'make test'
# Or for interactive shell:
#   docker run -it --rm qrscan
FROM ubuntu:18.04

# configure locale
RUN apt update -qq > /dev/null && apt install --yes --no-install-recommends \
    locales && \
    locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

# install system dependencies
RUN apt install --yes --no-install-recommends \
    build-essential \
    ccache \
    cmake \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libpython3.6-dev \
    libzbar-dev \
    lsb-release \
    make \
    pkg-config \
    python3 \
    python3-dev \
    sudo \
    tox \
    virtualenv

WORKDIR /app
COPY . /app
RUN make virtualenv
