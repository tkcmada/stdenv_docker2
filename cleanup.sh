#!/bin/sh

sudo docker ps -f status=exited -f status=created -f status=dead -f status=paused -q | while read id
do
  sudo docker rm $id || exit 1
done || exit 1

sudo docker images -f dangling=true -q | while read id
do
  sudo docker rmi $id || exit 1
done || exit 1



