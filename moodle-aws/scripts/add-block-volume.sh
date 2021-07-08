#!/bin/bash

# Cria a pasta /data
mkdir /data

# Monta disco para gravar dados do banco
mkfs.xfs /dev/xvdf
mount /dev/xvdf /data
echo '/dev/xvdf /data xfs defaults 0 0' >> /etc/fstab
