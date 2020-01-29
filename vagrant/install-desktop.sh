#!/bin/sh
set -ex

export DEBIAN_FRONTEND=noninteractive

# Set password for default "ubuntu" user
echo "ubuntu:ubuntu" | sudo chpasswd

# https://askubuntu.com/questions/1067929/on-18-04-package-virtualbox-guest-utils-does-not-exist
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-get install ubuntu-desktop -y

# Install xfce and virtualbox additions.

sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
# Permit anyone to start the GUI
# TODO - needed?
#sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config

# Use English keyboard layout
L='en' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard
