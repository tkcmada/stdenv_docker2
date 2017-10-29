# stdenv_docker

this project is for managing dockerfile by docker registry

# Preparation

1. (Windows10) install Docker for Windows
2. set PATH to Docker command

# How to run docker registry

1. Right click "Docker for Windows" in task tray - Settings - Shared Drive - check "c" drive - "Apply"
2. pull docker-registry
```
docker pull registry:2.3.0
```
or
```
cd /d image
copy /b registry-2.3.0.tar.zip.* registry-2.3.0.tar.zip
unzip registry-2.3.0.tar.zip
docker load < registry.tar
#Loaded image: registry:2.3.0
#Loaded image: registry:latest
```
3. Run "registry_unzip.bat" to unarhive "registry" directory
4. Run "docker-registry-run.bat" to run docker registry.

# How to pull docker image from registry

```
docker pull localhost:5000/stdenv_tools
```

Run image
```
docker run -it localhost:5000/stdenv_tools bash
```

# How to build and push docker registry

1. Edit your Dockerfile
```
stdenv_tools $ docker build -t stdenv_tools .
```
2. Tag and push
```
docker stdenv_tools localhost:5000/stdenv_tools
docker push localhost:5000/stdenv_tools
```
This can be done by drag and drop Dockerfile folder (i.e. "stdenv_tools" folder) on "push_registry.bat", so that docker image is pushed to localhost docker registry.

3. You docker image is now located in stdenv_docker/repo folder.

4. Run "repo_zip.bat" to archive repo directory into repo.zip.001...

# How to commit registry folder?

```
registry_zip.bat
```

# How to concat XXX.zip.001... ?

```bat
copy /b XXX.zip.* XXX.zip
```

2. now you will get XXX.zip

3. double-click XXX.zip to unzip it

How docker image looks like ?
-----------------------------

1. Let's untar docker image
```
tar xvf sample.tar
```

2. you will see following tree structure.

+ sample.tar
 + xxxxxxx/layer.tar
 + yyyyyyy/layer.tar

stdenv_tools
------------

This dockerfile contains basic tools for stdenv.
Take a look stdenv_tools/Dockerfile to see what are installed.

How to run bash interactive console for stdenv_tools container
```sh
stdenv_tools $ docker run -it bash
```

How to run services in docker
```sh
stdenv_tools $ kick_service.bat
stdenv_tools $ run_bash_on_service.bat
```

How to use terraform
--------------------
```sh
date #make sure time is correct. otherwise aws authentication will fail.
ntpdate ntp.nict.jp
cd /root/terraform-sample
terraform init
terraform plan
terraform apply
```

If you see the following error, probably your docker time is not correct. run reset_date.bat
"provider.aws: SignatureDoesNotMatch: Signature expired:"
