#!/bin/bash

#Docker EE in RHEL7のときはsubscription-managerではなく、yum-config-managerを使う
for repo in $@
do
  echo enabling $repo
  yum-config-manager --enable $repo || exit 1
done || exit 1
