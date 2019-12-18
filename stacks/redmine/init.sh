#!/bin/bash
# {app_name} = name for your app or project_name
# {stack_name} = name for your container
# i.e. ./init.sh {app_name} {stack_name}
# before chmod +x *.sh
# e.g. ./init.sh gprojects redmine
#
if [[ ! $1 || ! $2 ]]; then
  echo $"Use ./$0 {app_name} {stack_name}"
  chmod +x $0
  exit 1;
fi
# e.g. Create app gprojects
APP_NAME=$1
#e.g. Create stack redmine
STACK_NAME=$2
#$PWD/stacker/gprojects
APP_PATH=$(pwd)/$APP_NAME

echo APP_NAME=$APP_NAME
echo STACK_NAME=$STACK_NAME
echo APP_PATH=$APP_PATH
#mkdir -p $PWD/stacker/gprojects/redmine
mkdir -p $APP_PATH/$STACK_NAME

cd $APP_PATH/$STACK_NAME
#mkdir -p $PWD/stacker/gprojects/files
mkdir -p $APP_PATH/files
#mkdir -p $PWD/stacker/gprojects/postgres
mkdir -p $APP_PATH/postgres

echo "version: '3.1'
services:
  redmine:
    container_name: "$STACK_NAME"_redmine
    image: redmine:latest
    restart: always
    volumes:
      - ./redmine:/usr/src/redmine
      - ./files:/usr/src/redmine/files
    ports:
      - 3000:3000
    environment:
      - "TZ=America/Sao_Paulo"
      - 'REDMINE_DB_POSTGRES="$STACK_NAME"'
      - 'REDMINE_DB_DATABASE="$STACK_NAME"'
      - 'REDMINE_DB_PASSWORD=secret'
  postgres:
    container_name: "$STACK_NAME"_postgres
    image: postgres:latest
    restart: always
    volumes:
      - ./postgres:/var/lib/postgresql/data
    ports:
      - 5432:5432
    environment:
      - "TZ=America/Sao_Paulo"
      - 'POSTGRES_PASSWORD=secret'
      - 'POSTGRES_DB=redmine'" >> $APP_PATH/docker-compose.yml
cd $APP_PATH && docker-compose up -d