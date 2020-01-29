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
sudo useradd tensorflow
ssh-keygen -b 1024 -f tensorflow -t dsa     
sudo mkdir -p /home/tensorflow/.ssh
cat tensorflow.pub | sudo tee -a /home/tensorflow/.ssh/authorized_keys  
sudo chmod 600 /home/tensorflow/.ssh/authorized_keys
sudo chmod 700 /home/tensorflow/.ssh
sudo chown -R tensorflow /home/tensorflow

# Add Anaconda
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /home/tensorflow/anaconda3
source ~/.bashrc
export PATH=/home/tensorflow/anaconda3/bin:$PATH >> ~/.bashrc
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

# Install UMAKE
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
sudo apt-get update
sudo apt-get install ubuntu-make -y

# Install PyCharm
cd /home/tensorflow
sudo mkdir ide
cd ide
sudo mkdir pycharm
umake ide pycharm /home/tensorflow/ide/pycharm

# Install Andoid Studio
sudo mkdir android
umake android
