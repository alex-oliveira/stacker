#!/bin/bash
#
# $ /stacker/init.sh {project_name} {stack_name}
#

STACK_NAME=$2

APP_NAME=$1
APP_PATH=$(pwd)/$APP_NAME

mkdir -p ${APP_PATH}/configs
mkdir -p ${APP_PATH}/logs
mkdir -p ${APP_PATH}/logs/mysql
mkdir -p ${APP_PATH}/logs/nginx
mkdir -p ${APP_PATH}/logs/postgres
mkdir -p ${APP_PATH}/logs/redis
mkdir -p ${APP_PATH}/storage
mkdir -p ${APP_PATH}/storage/mysql
mkdir -p ${APP_PATH}/storage/nginx
mkdir -p ${APP_PATH}/storage/postgres
mkdir -p ${APP_PATH}/storage/sqlite

cd $APP_NAME

cp /stacker/stacks/$STACK_NAME/.env .
cp /stacker/stacks/$STACK_NAME/docker-compose.yml .

sed -i 's/APP_NAME=APP_NAME/APP_NAME='$(echo $APP_NAME | sed 's/\//\\\//g')'/g' .env
sed -i 's/APP_PATH=APP_PATH/APP_PATH='$(echo $APP_PATH | sed 's/\//\\\//g')'/g' .env

docker-compose build
docker-compose up -d