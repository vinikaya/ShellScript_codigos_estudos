#1/bin/bash

CAMINHO_NOME=/home/vinicius

cd $CAMINHO_NOME
if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -u root $1 > $CAMINHO_NOME/backup/$1.sql
if [ $? -eq 0 ]
then
	echo " Backup foi realizado com sucesso"
else
	echo "houve um problema no backup"
fi
