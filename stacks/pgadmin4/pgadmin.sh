#!/bin/bash
# -------------------------------------------------------
# e.g. pgadmin.sh pgadmin4
# -------------------------------------------------------
stack_name="$1"

if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
# Step for your stack
mkdir -p $PWD/$stack_name/data/pgadmin

echo "version: '3'

services:
  pgadmin4:
    container_name: "$stack_name"_pgadmin4
    image: dpage/pgadmin4
    environment:
      VIRTUAL_HOST=pgadmin.example.com
      PGADMIN_DEFAULT_EMAIL: "email.example.com"
      PGADMIN_DEFAULT_PASSWORD: "secret"
    volumes:
      - ./data/pgadmin:/var/lib/pgadmin
    ports:
      - "8040:80"" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d