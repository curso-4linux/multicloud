#!/bin/bash

# Configura ambiente EFS
yum install amazon-efs-utils -y

mkdir /moodlesite
mount -t efs -o tls,accesspoint=fsap-0dad50e0fc42eedef fs-b83bd2a0:/ /moodlesite

echo 'fs-b83bd2a0:/ /moodlesite efs defaults,_netdev 0 0' >> /etc/fstab
