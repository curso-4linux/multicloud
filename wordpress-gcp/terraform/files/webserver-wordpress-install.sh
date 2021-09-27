#!/bin/bash

# Remove linhas comentadas do arquio docker-compose.yml
sed '/^[[:blank:]]*#/d;s/#.*//' /home/suporte-gcp/multicloud/wordpress-gcp/compose-web/docker-compose.yml

# Atualiza o container webserver-wordpress
cd /home/suporte-gcp/multicloud/wordpress-gcp/compose-web
docker-compose up -d
