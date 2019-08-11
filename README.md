## Scripts and Files for a Fresh Ubuntu Setup.

Preinstall:

 - Update the Kernel: http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.2/
 - Resolve any driver issues.
   - Video card drivers rely on the kernel version, lightdm/gdm3, and Wayland Enabling
   - Resolve any other driver issues
 - Reboot

Install:

 - Run `install_0.sh`.
 - Assuming all went well, run `install_1.sh`.
 - Install tensorflow and cuda+ manually: https://www.tensorflow.org/install
 - Install mendeley manually: https://www.mendeley.com/download-desktop/
 - Install deadbeef manually: http://deadbeef.sourceforge.net/download.html
 - Install kicad manually: http://kicad-pcb.org/download/ubuntu/

 - Configure codecs to get libdvdcss2:

        dpkg-reconfigure libdvd-pkg

 - Configure git:

        git config --global user.email "you@example.com"
        git config --global user.name "Your Name"
        git config --global credential.helper store
        git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

 - Install Cinnamon Desktop:

        sudo apt install -y cinnamon-desktop-environment lightdm
        dpkg-reconfigure lightdm

#### Set default programs*
*TODO: Automate?  Slightly paranoid about using `sed` for this.

 - For sublime text specifically, check which of these files exists:

        ls /usr/share/applications/sublime_text.desktop # make sure this exists
        ls /usr/share/applications/sublime-text.desktop # might be this instead on some systems

 - Then find/replace `gedit` with `sublime_text` or `sublime-text`, do the same for `vlc` and `deadbeef` respectively:

        sudo nano /usr/share/applications/defaults.list

 - From within PyCharm, click top left "tool" menu -> "create desktop entry" (necessary to lock to launcher).

 - Build Elasticsearch (5.5) from Source: Place binary in `/usr/local/bin/elasticsearch`

 - Manually Set hosts filter:

        wget http://winhelp2002.mvps.org/hosts.txt
        cat hosts.txt >> /etc/hosts  # open and edit

 - Setup git-secrets
 - Install Slack
 - Install Zoom
 - Import Firefox Bookmarks + Install Add-Ons
 