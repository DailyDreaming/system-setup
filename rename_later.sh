# uninstall PHP

sudo apt-get remove –purge php*
sudo apt-get purge php*
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get remove dbconfig-php
sudo apt-get dist-upgrade
sudo dpkg --get-selections | grep php | cut -f 1
sudo apt-get remove --purge <package name from the previous command output>
sudo whereis php
sudo rm -rf <directory/file path from the previous command output>

# uninstall Apache

sudo service apache2 stop
sudo apt-get purge apache*
sudo apt-get autoremove
sudo dpkg --get-selections | grep apache | cut -f 1
sudo apt-get remove --purge <package name from the previous command output>
sudo whereis apache
sudo rm -rf <directory/file path from the previous command output>

# uninstall MySQL

sudo apt-get remove –purge mysql*
sudo apt-get purge mysql*
sudo apt-get autoremove.
sudo apt-get autoclean.
sudo apt-get remove dbconfig-php.
sudo apt-get dist-upgrade.
sudo dpkg --get-selections | grep mysql | cut -f 1
sudo apt-get remove --purge <package name from the previous command output>
sudo whereis mysql
sudo rm -rf <directory/file path from the previous command output>
