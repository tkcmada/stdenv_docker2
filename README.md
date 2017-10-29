# stdenv_docker

this project is for managing dockerfile by docker registry

# Preparation

1. (Windows10) install Docker for Windows
2. set PATH to Docker command

# How to build docker image

```
stdenv_tools $ docker build -t stdenv_tools .
```
or

Drag and drop stdenv_tools folder onto "stdenv_docker2/build.bat"

# How to build docker registry AMI.

run "packer-stdenv-docker-registry\packer_build.bat"

# How to run docker registry

1. run stdenv-docker-registry AMI
2.
```
docker run -d registry
```
