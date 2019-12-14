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

cp ../../stacks/$STACK/docker-compose.yml .

sed -i 's/__APP_ROOT__/${APP_ROOT}/g' ${APP_ROOT}/docker-compose.yml