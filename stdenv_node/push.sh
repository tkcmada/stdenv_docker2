#!/bin/sh

sudo docker tag  stdenv_node localhost:8000/stdenv_node
sudo docker push localhost:8000/stdenv_node
