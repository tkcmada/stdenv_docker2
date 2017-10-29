#!/bin/bash

export TZ=Asia/Tokyo
export AWS_DEFAULT_REGION=ap-northeast-1
export AWS_DEFAULT_OUTPUT=json

echo "$@"
"$@"
