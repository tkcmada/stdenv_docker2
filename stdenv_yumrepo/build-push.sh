#!/bin/sh

name=stdenv_yumrepo
host=localhost:8000

sudo docker build -t $name .
sudo docker tag $name $host/$name
sudo docker push $host/$name


