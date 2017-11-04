#!/bin/bash

#Docker EE in RHEL7‚Ì‚Æ‚«‚Ísubscription-manager‚Å‚Í‚È‚­Ayum-config-manager‚ğg‚¤
for repo in $@
do
  echo enabling $repo
  yum-config-manager --enable $repo || exit 1
done || exit 1
