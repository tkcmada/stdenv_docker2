#!/bin/bash

#Docker EE in RHEL7�̂Ƃ���subscription-manager�ł͂Ȃ��Ayum-config-manager���g��
for repo in $@
do
  echo enabling $repo
  yum-config-manager --enable $repo || exit 1
done || exit 1
