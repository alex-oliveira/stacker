#!/bin/bash
# -------------------------------------------------------
# e.g. pgadmin.sh mssql
# -------------------------------------------------------
stack_name="$1"

if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
# Step for your stack
mkdir -p $PWD/$stack_name/data/SQLServer

echo "version: "3.2"
services:

  mssql:
    container_name: "$stack_name"_mssql
    image: microsoft/mssql-server-linux:2017-latest
    environment:
      SA_PASSWORD: "secret"
      ACCEPT_EULA: "Y"
    ports:
      - "1433:1433"
    volumes:
      - "./data/db:/var/opt/mssql/data"" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d