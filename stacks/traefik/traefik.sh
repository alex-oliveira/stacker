#!/bin/bash
# -------------------------------------------------------
# e.g. traefik.sh traefik
# -------------------------------------------------------
stack_name="$1"

if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
#
echo "version: '3'

services:
  reverse-proxy:
    # The official v2.0 Traefik docker image
    image: traefik:v2.0
    container_name: "$stack_name"-proxy
    # Enables the web UI and tells Traefik to listen to docker
    command: --api.insecure=true --providers.docker
    ports:
      # The HTTP port
      - "80:80"
      # The Web UI (enabled by --api.insecure=true)
      - "8080:8080"
    volumes:
      # So that Traefik can listen to the Docker events
      - /var/run/docker.sock:/var/run/docker.sock" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d
