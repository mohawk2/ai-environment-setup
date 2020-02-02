#!/bin/sh
set -ex

export DEBIAN_FRONTEND=noninteractive

# Set password for default "ubuntu" user
echo "ubuntu:ubuntu" | sudo chpasswd

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-get install ubuntu-desktop -y

# dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'Anaconda.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'PyCharm.desktop', 'AndroidStudio.desktop']"

sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Use English keyboard layout
#L='en' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard
