#!/bin/bash

CAMINHO_BACKUP=/home/vinicius/backup_mitilidae_amazom
cd $CAMINHO_BACKUP
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(mysql -u root mutilidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	mysqldump -u root mutilidae $tabela >$CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-scrip-vini

