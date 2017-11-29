#!/bin/sh

nohup docker build -t stdenv_cdhrepo . 2>&1 > build.log &


