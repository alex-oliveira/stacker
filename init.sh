#!/bin/bash
#Autor: Guilherme Rodrigues
#Finalidade: Criação de Stacks
#DATA: 24/dez/2019

#Ex: ./init.sh nome-stack 

STACK=$1

echo $STACK

cp ../../stacks/$STACK/docker-compose.yml .
