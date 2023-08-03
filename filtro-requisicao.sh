#!/bin/bash

cd ~/workspace

if [ -z $1 ]
then
	while [ -z $requisicao ]
	do
		read -p "voce esqueceu de colocar o parametro (GET,PUT,POST,DELETE):" requisicao
		param_maiusculo=$(echo $requisicao | awk '{ print toupper($1) }')
	done
else	
	param_maiusculo=$(echo $1 | awk '{ print toupper($1) }')
fi

case $param_maiusculo in
	GET)
	cat apache.log | grep GET
	;;
	
	POST)
	cat apache.log | grep POST
	;;
	
	PUT)
	cat apache.log | grep PUT
	;;
	
	DELETE)
	cat apache.log | grep DELETE
	;;
		
	*)
	echo "O parametro passado não e valido"
	;;
esac
	
