#!/usr/bin/env bash

# update the system
apt update && apt -y upgrade && apt -y dist-upgrade
apt install -y $(awk '{print $1'} ~/git/system-setup/apt.packages)
