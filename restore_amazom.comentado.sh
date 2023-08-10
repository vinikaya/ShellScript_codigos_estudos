#!/bin/bash

CAMINHO_RESTORE=/home/vinicius/restore_mutilidae_amazom	#Foi criado a pasta na qual ficara o conteudo puxado do aws.
aws s3 sync s3://curso-shell-scrip-vini/$(date +%F) $CAMINHO_RESTORE #Faz o download do arquivo com nome da data do dia no $CAMINHO_RESTORE.

cd $CAMINHO_RESTORE 	#Entra na pasta onde está os arquivos baixados do aws.	

if [ -f $1.sql ] 	#Verifica se existe o arquivo mensionado, para rodar o codigo deve ser passado como atributo o nome da tabela na qual será restaurada.

then
	mysql -u root mutilidae < $1.sql #entra no mysql e faz a integração da tabela baixada e passada como atributo no banco de dados mutilidae.
	if [ $? -eq 0 ]
	then
		echo "O restore foi realizado com sucesso"
	fi
else
	echo "O arquivo procurado não existe no diretorio"
fi


