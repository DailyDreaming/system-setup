#!/usr/bin/env bash

# Install Sublime-Text
# https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

# Install Rust
# https://www.rust-lang.org/en-US/install.html
curl https://sh.rustup.rs -sSf | sudo sh

# Install Calibre
# https://calibre-ebook.com/download_linux
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Install Cloudwatch CLI (Live Stream)
# https://github.com/lucagrulla/cw
sudo go get github.com/lucagrulla/cw
export PATH="$PATH:/home/$USER/go/bin"

# Install Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install -y docker-ce
# sudo usermod -aG docker ${USER}
# su - ${USER}

# Install Pycharm
# https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux
wget https://download-cf.jetbrains.com/python/pycharm-professional-2019.2.tar.gz
sudo tar xf pycharm-professional-2019.2.tar.gz -C /opt/
cd /opt/pycharm-2019.2/bin
sudo sh /opt/pycharm-2019.2/bin/pycharm.sh
sudo cp ~/git/system-setup/launchers/pycharm.desktop /usr/share/applications/pycharm.desktop
cd ~/git

# Install Terraform
wget https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip
unzip ./terraform_0.12.4_linux_amd64.zip -d /usr/local/bin/
sudo chmod +x /usr/local/bin/terraform
rm  terraform_0.12.4_linux_amd64.zip

# Install ecs-cli
sudo curl -o /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest
echo "$(curl -s https://s3.cn-north-1.amazonaws.com.cn/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5) /usr/local/bin/ecs-cli" | md5sum -c -
sudo chmod +x /usr/local/bin/ecs-cli

# Install Google SDK
# https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
sudo apt update && sudo apt install -y google-cloud-sdk

# Install Chrome (Firefox is an Apt Package; Install Both)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Purge Useless Programs
sudo apt purge -y avahi-daemon  # garbage
sudo apt purge -y rhythmbox  # use deadbeef instead
sudo apt purge -y totem  # use VLC player instead

# Gnome Settings (always show the path)
sudo gsettings set org.gnome.nautilus.preferences always-use-location-entry true
sudo gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'

# Scripts
sudo cp ~/git/system-setup/bin/switch.py /usr/local/bin/switch.py
sudo cp ~/git/system-setup/bin/gs_json.py /usr/local/bin/gs_json.py

# Update Everything One Final Time
sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade
