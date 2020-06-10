#!/usr/bin/env bash

# .bashrc aliases and functions
sudo cat ~/git/system-setup/dotfiles/.bashrc >> ~/.bashrc

mkdir ~/.credentials

# Delete Examples
sudo rm -rf ~/examples.desktop

# Update Everything
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
# Install Apt Packages
sudo apt-get install -y $(awk '{print $1'} ~/git/system-setup/apt.packages)
