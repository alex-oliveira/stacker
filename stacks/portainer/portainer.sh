#!/bin/bash
# -------------------------------------------------------
# e.g. init.sh portainer
# -------------------------------------------------------
stack_name="$1"
# e.g. init.sh portainer
if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
#
echo "version: '2'

services:
  portainer:
    container_name: "$stack_name"_portainer
    image: portainer/portainer
    restart: always
    ports:
      - "9000:9000"
    command: -H unix:///var/run/docker.sock
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d