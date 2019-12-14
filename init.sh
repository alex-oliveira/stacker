#!/bin/bash
#
# Autor.......: Guilherme Rodrigues | Alex Oliveira
#
# Data........: 14/12/2019
# Finalidade..: Criação de Ambientes
#

# Ex: ./init.sh nome-stack

STACK=$1
APP_ROOT=$(pwd)

cp ../../stacks/$STACK/.env .
cp ../../stacks/$STACK/docker-compose.yml .

sed -i 's/__APP_ROOT__/${APP_ROOT}/g' ${APP_ROOT}/.env

mkdir -p ${APP_ROOT}/data/database
mkdir -p ${APP_ROOT}/data/storage
mkdir -p ${APP_ROOT}/logs/nginx
mkdir -p ${APP_ROOT}/logs/database
mkdir -p ${APP_ROOT}/www

touch ${APP_ROOT}/www/index.html
echo "works!" > ${APP_ROOT}/www/index.html

#docker-compose build
#docker-compose up -d