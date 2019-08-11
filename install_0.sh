#!/usr/bin/env bash

# .bashrc aliases and functions
sudo cat ~/git/system-setup/dotfiles/.bashrc >> ~/.bashrc

mkdir ~/.credentials

# Delete Examples
sudo rm -rf ~/examples.desktop

# Update Everything
sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade
# Install Apt Packages
sudo apt install -y $(awk '{print $1'} ~/git/system-setup/apt.packages)
