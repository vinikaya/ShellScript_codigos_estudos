#!/bin/bash

CAMINHO_BACKUP=/home/vinicius/backup_mitilidae_amazom #criado o diretorio no qual vai ficar os arquivos a serem enviados a aws.
cd $CAMINHO_BACKUP
data=$(date +%F) 	#Pega a data atual e salva na variavel.
if [ ! -d $data ]	#Caso não exista um diretorio com o nome da data do dia, então ira criar uma.
then
	mkdir $data	#se não tiver irá criar uma pasta com o nome da data atual Exemplo 2023-08-10
fi

tabelas=$(mysql -u root mutilidae -e "show tables;" | grep -v Tables) #Esse comando entra no mysql e imprimi o nome das tabelas a dentro do banco mutilidae e usando o comando grep retiramos o cabeçalho.
for tabela in $tabelas	#Para cada tabela salva dentro da variavel $tabelas ele ira execultar o comando a baixo.
do
	mysqldump -u root mutilidae $tabela >$CAMINHO_BACKUP/$data/$tabela.sql	#mysqldump é um comando para fazer backups de tabelas, esse comando acessa o mysql com o root no banco mutilidae e salva a tabela salva na variavel $tabelas dentro do caminho especificado, dentro do diretorio com nome da data do dia.
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-scrip-vini #Entra dentro do aws configurado no servidor e envia o todo conteudo dentro da pasta backup_mutilidae_amazom para o bucket criado na aws e especificado na linha a cima.


#Para enviar a amazom foi criado uma conta na aws com acesso gratis de 12 meses, no serviço de 'storage' e 'S3' foi criado um bucket chamado 'curso-shell-scrip-vini'(container for data stored in S3), após foi acessado o seviço 'Security,Indentity...' a opção 'IAM'(ferramenta de controle de recursors) e criado um usario 'vinicius' e configurado o tipo de acesso programmatic(access key ID e Secret access key). No terminal do servidor foi instalado o cli da amazom e configurado o acesso do bucket com o comando 'aws configure'(colocado as chaves de acesso), após feita configuração correta é possivel rodar o codigo acima.
