#!/bin/bash -x

# Install packages
apt-get update

# Install git
apt-get -y install git

# Install Open JDK
sudo apt install default-jdk

# Install AWS CLI
sudo apt-get install awscli -y

# Add user
#sudo useradd -d /home/tensorflow -m -p $(echo "tensorflow" | openssl passwd -1 -stdin) tensorflow sudo
#sudo useradd -m -p $(echo "tensorflow" | openssl passwd -1 -stdin) tensorflow
#sudo usermod –aG sudo tensorflow
#echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
echo "tensorflow ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

#ssh-keygen -b 1024 -f tensorflow -t dsa
#sudo mkdir -p /home/tensorflow/.ssh
#cat tensorflow.pub | sudo tee -a /home/tensorflow/.ssh/authorized_keys
#sudo chmod 600 /home/tensorflow/.ssh/authorized_keys
#sudo chmod 700 /home/tensorflow/.ssh
#sudo chown -R tensorflow /home/tensorflow

# Add Anaconda
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3
export PATH=/opt/anaconda3/bin:$PATH >> /home/ubuntu/.profile
export PATH=/opt/anaconda3/bin:$PATH >> /home/ubuntu/.bashrc

sed -i 'export PATH=/opt/anaconda3/bin:$PATH' /home/ubuntu/.profile
sed -e -i "\$aexport PATH=/opt/anaconda3/bin:$PATH" /home/ubuntu/.profile

sed -i -e '$a\' -e 'export PATH=/opt/anaconda3/bin:$PATH' /home/ubuntu/.profile

#export PATH=/home/tensorflow/anaconda3/bin:$PATH >> /home/tensorflow/.bashrc
export CONDA_ALWAYS_YES="true"
conda init
conda update -n base -c defaults conda
conda create -n ai
conda activate ai
conda install requests -y
conda install numpy -y
conda install pandas -y
conda install tensorflow -y
conda install tensorflow-estimator -y
conda install tensorflow-hub -y
conda install tensorflow-tensorboard -y
conda install git -y

# Clean up Anaconda download
rm Anaconda3-2019.10-Linux-x86_64.sh

# Install UMAKE
sudo add-apt-repository ppa:lyzardking/ubuntu-make -y
sudo apt-get update
sudo apt-get install ubuntu-make -y

# Install PyCharm
sudo env -u SUDO_UID -u SUDO_GID umake ide pycharm /opt/pycharm

sed -i -e '$a\' -e 'export PATH=/opt/pycharm/bin:$PATH' /home/ubuntu/.profile

# Install Andoid Studio
sudo env -u SUDO_UID -u SUDO_GID umake android /opt/android --accept-license

sed -i -e '$a\' -e 'export PATH=/opt/android/bin:$PATH' /home/ubuntu/.profile

# As a service
#sudo systemctl enable jupyter-notebook

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'Anaconda.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'PyCharm.desktop', 'AndroidStudio.desktop']"
# https://askubuntu.com/questions/1193496/add-app-to-favorites-from-command-line/1193510