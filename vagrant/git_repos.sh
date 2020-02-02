#!/bin/bash -x

# Create repo directory in /var/repo
cd /var
sudo mkdir repo
cd repo

# Clone the repos with tensorflow examples
sudo git clone https://github.com/tensorflowRUs/dlaicourse.git deeplearning/course/code
sudo git clone https://github.com/tensorflowRUs/examples.git tensoflow/examples
