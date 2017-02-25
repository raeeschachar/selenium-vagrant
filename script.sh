#!/bin/sh
#=========================================================

#=========================================================
echo "Set autologin for the Vagrant user..."
#=========================================================
sudo sed -i '$ d' /etc/init/tty1.conf
sudo echo "exec /sbin/rungetty --autologin vagrant tty1" >> /etc/init/tty1.conf

#=========================================================
echo -n "Start X on login..."
#=========================================================
PROFILE_STRING=$(cat <<EOF
if [ ! -e "/tmp/.X0-lock" ] ; then
    startx
fi
EOF
)
echo "${PROFILE_STRING}" >> .profile
echo "ok"

#=========================================================
echo -n "Add host alias..."
#=========================================================
echo "192.168.33.1 host" >> /etc/hosts
echo "ok"

#=========================================================
echo -n "Install Pip"
#=========================================================
sudo apt-get install python-setuptools python-dev build-essential -y
sudo easy_install pip 

#=========================================================
echo -n "Install Firefox v46"
#=========================================================
sudo apt-get remove firefox
wget https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_45.0.2-0ubuntu1_amd64.deb
sudo dpkg -i firefox-mozilla-build_45.0.2-0ubuntu1_amd64.deb
sudo apt-mark hold firefox

#=========================================================
echo -n "Install Git"
#=========================================================
sudo apt-get update
sudo apt-get install git -y

#=========================================================
echo "Reboot the VM"
#=========================================================
sudo reboot
