#!/bin/bash

#check if subscription-manager is avaialbe
subscription-manager version
if [ $? = 78 ]
then
  #subscription-manager is disabled. probably you are in docker EE in RHEL7
  #so use yum-config-manager instead of subscription-manager
  for repo in $@
  do
    echo enabling $repo
    yum-config-manager --enable $repo || exit 1
  done || exit 1
  exit 0
else
  echo "RHEL_USER:$RHEL_USER"
  echo "RHEL_PASSWORD:$RHEL_PASSWORD"
  subscription-manager register --name="docker_$HOSTNAME" --username=$RHEL_USER --password=$RHEL_PASSWORD || exit 1
  subscription-manager list --available > subscription-available.txt || exit 1
  python subscription-find-pool.py < subscription-available.txt > pool.txt || exit 1
  subscription-manager subscribe --pool=`cat /root/pool.txt` || exit 1
  for repo in $@
  do
    echo enabling $repo
    subscription-manager repos --enable=$repo || exit 1
  done || exit 1
  exit 0
fi

