#!/usr/bin/env bash

# .bashrc aliases and functions
cat ~/git/system-setup/dotfiles/.bashrc >> ~/.bashrc

mkdir ~/.credentials

# Delete Examples
rm -rf ~/examples.desktop

# Update Everything
apt update && apt -y upgrade && apt -y dist-upgrade
# Install Apt Packages
apt install -y $(awk '{print $1'} ~/git/system-setup/apt.packages)

# Install Sublime-Text
# https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt install -y sublime-text

# Install Rust
# https://www.rust-lang.org/en-US/install.html
curl https://sh.rustup.rs -sSf | sh

# Install Calibre
# https://calibre-ebook.com/download_linux
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

# Install Cloudwatch CLI (Live Stream)
# https://github.com/lucagrulla/cw
go get github.com/lucagrulla/cw
export PATH="$PATH:/home/$USER/go/bin"

# Install Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt-cache policy docker-ce
apt install -y docker-ce
usermod -aG docker ${USER}
su - ${USER}

# Install Pycharm
# https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux
wget https://download-cf.jetbrains.com/python/pycharm-professional-2019.2.tar.gz
tar xf pycharm-professional-2019.2.tar.gz -C /opt/
cd /opt/pycharm-2019.2/bin
sh /opt/pycharm-2019.2/bin/pycharm.sh
cd ~/git

wget https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip
unzip ./terraform_0.12.4_linux_amd64.zip -d /usr/local/bin/
chmod +x /usr/local/bin/terraform
rm  terraform_0.12.4_linux_amd64.zip

# Install ecs-cli
sudo curl -o /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest
echo "$(curl -s https://s3.cn-north-1.amazonaws.com.cn/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5) /usr/local/bin/ecs-cli" | md5sum -c -
chmod +x /usr/local/bin/ecs-cli

# Install Google SDK
# https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
apt update && apt install -y google-cloud-sdk

# Install Chrome (Firefox is an Apt Package; Install Both)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Purge Useless Programs
apt purge -y avahi-daemon  # garbage
apt purge -y rhythmbox  # use deadbeef instead
apt purge -y totem  # use VLC player instead

# Gnome Settings (always show the path)
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'

# Scripts
cp ~/git/system-setup/bin/switch.py /usr/local/bin/switch.py
cp ~/git/system-setup/bin/gs_json.py /usr/local/bin/gs_json.py
