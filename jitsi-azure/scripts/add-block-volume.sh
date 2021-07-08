#!/bin/bash

# Cria a pasta /jitsi-meet-confs
sudo mkdir /jitsi-meet-confs

# Monta disco para gravar dados das confs
sudo mkfs.xfs /dev/sdc 
sudo mount -t xfs /dev/sdc /jitsi-meet-confs
sudo bash -c 'echo "/dev/sdc /jitsi-meet-confs xfs defaults 0 0" >> /etc/fstab'
