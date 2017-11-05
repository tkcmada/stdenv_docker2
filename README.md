# stdenv_docker2

this project is for managing dockerfile by docker registry.

# Links

- [stdenv_hadoop README.md](stdenv_hadoop/README.md)

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

# How to build and run docker image

```
stdenv_tools $ build.bat
# this build docker container and tag it as "stdenv_tools"

stdenv_tools $ docker run -it stdenv_tools bash
```

# How to push docker image to registry.

1. (preparation) setenv.bat should be modified to point to your private docker registry.
2. run push.bat to push image to registry

# Error "Get https://www.xxx.yyy.zzz:8000/v2/: http: server gave HTTP response to HTTPS client" while docker push

add host and port to %USERPROFILE%/.docker/daemon.json
```json
  "insecure-registries": [
    "www.xxx.yyy.zzz:8000"
  ],
```
