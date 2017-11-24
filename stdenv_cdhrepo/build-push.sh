#!/bin/sh

name=stdenv_cdhrepo

docker build -t $name .
docker tag $name stdenvregistry:8000/$name
docker push stdenvregistry:8000/$name

