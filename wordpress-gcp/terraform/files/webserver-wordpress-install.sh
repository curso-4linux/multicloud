#!/bin/bash

# Configura ambiente de Logs
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
bash add-logging-agent-repo.sh --also-install

systemctl start google-fluentd
systemctl enable google-fluentd

# Configura compartilhamento remoto /wpsite
apt install nfs-common -y

mkdir /wpsite
echo '10.51.215.2:/wpsite /wpsite nfs defaults,_netdev 0 0' >> /etc/fstab
mount /wpsite

# Instala agent de monitoramento (stackdriver-agent)
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
bash add-monitoring-agent-repo.sh --also-install
systemctl enable stackdriver-agent
systemctl start stackdriver-agent

# Instala o Docker
apt update
apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce docker-ce-cli containerd.io git -y

# Instala o Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/sbin/docker-compose
chmod +x /usr/local/sbin/docker-compose

# Cria a rede wp-net no Docker
docker network create wp-net

# Clona repositorio do github
git clone -n https://github.com/roberto-farias/multicloud
cd multicloud
git checkout HEAD wordpress-gcp

# Inicia o container webserver-wordpress
cd wordpress-gcp/compose-web
docker-compose up -d
