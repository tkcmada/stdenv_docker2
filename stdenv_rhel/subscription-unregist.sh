#!/bin/bash

subscription-manager remove --all
subscription-manager unregister
subscription-manager clean
subscription-manager list
