#!/bin/bash

# Configura ambiente EFS
sudo yum install amazon-efs-utils -y

sudo mkdir /moodlesite
sudo mount -t efs -o tls,accesspoint=fsap-0dad50e0fc42eedef fs-b83bd2a0:/ /moodlesite

sudo bash -c 'echo "fs-b83bd2a0:/ /moodlesite efs defaults,_netdev 0 0" >> /etc/fstab'
