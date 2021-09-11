#!/bin/bash

# Cria a pasta /jitsi-backup-confs
sudo mkdir /jitsi-backup-confs

# Monta disco para gravar backup das configurações do Jitsi
sudo mkfs.xfs /dev/sdc
sudo mount -t xfs /dev/sdc /jitsi-backup-confs
sudo bash -c 'echo "/dev/sdc /jitsi-backup-confs xfs defaults 0 0" >> /etc/fstab'
