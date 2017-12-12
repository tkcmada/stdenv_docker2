#!/bin/sh

name=stdenv_rhel
host=localhost:8000

sudo docker build -t $name .
sudo docker tag $name $host/$name
sudo docker push $host/$name


