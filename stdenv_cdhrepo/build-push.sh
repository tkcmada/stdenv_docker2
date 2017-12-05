#!/bin/sh

name=stdenv_cdhrepo
host=stdenvregistry.ddns.net:8000

sudo docker build -t $name .
sudo docker tag $name $host/$name
sudo docker push $host/$name


