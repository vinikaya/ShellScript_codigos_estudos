#!/bin/bash

CAMINHO_RESTORE=/home/vinicius/restore_mutilidae_amazom
aws s3 sync s3://curso-shell-scrip-vini/$(date +%F) $CAMINHO_RESTORE

cd $CAMINHO_RESTORE 
if [ -f $1.sql ]
then
	mysql -u root mutilidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "O restore foi realizado com sucesso"
	fi
else
	echo "O arquivo procurado não existe no diretorio"
fi


