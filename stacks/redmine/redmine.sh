#!/bin/bash
# -------------------------------------------------------
# e.g. init.sh redmine
# -------------------------------------------------------
stack_name="$1"
# e.g. init.sh redmine
if [ ! $1 ]; then
echo $"Usage: $0 stack_name" && chmod +x $0 && exit 1;
fi
# Create dir if not exists
if [ ! -d $stack_name ]; then mkdir -p $stack_name; fi
#This case all volumes are create on /var/lib/docker/volumes
echo "version: '3.1'
services:
  postgres:
    container_name: "$stack_name"_postgres
    image: postgres:latest
    restart: always
    networks:
      - default
    volumes:
      - postgres-data:/var/lib/postgresql/data
    ports:
      - 5432:5432
    environment:
      - "TZ=America/Sao_Paulo"
      - 'POSTGRES_PASSWORD=secret'
      - 'POSTGRES_DB=redmine'
  redmine:
    container_name: "$stack_name"_redmine
    image: redmine:latest
    restart: always
    networks:
      - default
    volumes:
      - redmine-data:/usr/src/redmine
      - redmine-files:/usr/src/redmine/files
    ports:
      - 3000:3000
    environment:
      - "TZ=America/Sao_Paulo"
      - 'REDMINE_DB_POSTGRES=postgres'
      - 'REDMINE_DB_DATABASE=redmine'
      - 'REDMINE_DB_PASSWORD=secret'
volumes:
  postgres-data:
  redmine-data:
  redmine-files:
networks:
  default:
    driver: bridge" > $PWD/$stack_name/docker-compose.yml
cd $PWD/$stack_name && docker-compose down && docker-compose up -d