# stdenv_docker2

this project is for managing dockerfile by docker registry

# Preparation

1. (Windows10) install Docker for Windows
2. set PATH to Docker command
3. run "load_rhel7.4.bat" to load rhel7.4 image as tag rhel7.4

# Directory structure

```
stdenv_docker2
 + stdenv_tools
    + Dockerfile
 + ...
    + Dockerfile
```

# How to build docker image

```
stdenv_tools $ docker build -t stdenv_tools .
```
or

Drag and drop stdenv_tools folder onto "stdenv_docker2/build.bat"

# How to build dcker registry AMI containing docker images

0. clone stdenv_packer (sibiling repository of this stdenv_docker2)
1. add your dirname of Dockerfile to stdenv_packer/stdenv-docker-registry/stdenv-docker-registry.json
2. set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY envvar of your AWS IAM user. The user needs to have EC2 instance permission.
2. run "stdenv_packer/stdenv-docker-registry/packer_build.bat"

What happens inside packer_build.bat ?

1. Launch AWS EC2 instance and ssh login it.
2. git clone stdenv_docker2
3. start docker registry
3. docker build follwoing Dockerfile
4. push docker image to registry
5. create AMI containing docker registry.

# How to run docker registry

1. find stdenv-docker-registry AMI and run it on AWS EC2.
2. login to the EC2 instance
```
docker run -it -p 8000:5000 registry
```

# How to pull docker image from local repository

```
docker pull localhost:8000/stdenv_tools
docker run -it localhost:8000/stdenv_tools /bin/bash
```

# How to run Hadoop in docker ?

[hadoop README.md](hadoop/README.md)
