#!/bin/bash
# -------------------------------------------------------
# e.g. nginx.sh nginx
# -------------------------------------------------------
stack_name="$1"

if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
# Step for your stack

echo "version: '2'
services:
  nginx-proxy:
    container_name: "$stack_name"-proxy
    image: jwilder/nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro

  whoami:
    image: jwilder/whoami
    container_name: whoami
    environment:
      - VIRTUAL_HOST=whoami.local" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d
curl -H "Host: whoami.local" localhost