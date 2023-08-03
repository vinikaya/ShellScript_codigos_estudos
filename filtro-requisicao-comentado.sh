#!/bin/bash

cd ~/workspace

if [ -z $1 ]	# o '-z' verifica se o parametro passado está vazio, se estiver vazio então ele fara:.
then
	while [ -z $requisicao ]	# Estrutura de repetição que sempre repetira se o '$requisisao' estiver vazio.
	do
		read -p "voce esqueceu de colocar o parametro (GET,PUT,POST,DELETE):" requisicao #'read' imprimi no terminal a mensagem e salva o parametro no ultimo termno da linha 'requisisao'.
		param_maiusculo=$(echo $requisicao | awk '{ print toupper($1) }')	# passa o parametro para letra maiuscula.
	done	#fecha o 'do' do 'while'.
else	
	param_maiusculo=$(echo $1 | awk '{ print toupper($1) }')	# passa o parametro para maiusculo
fi

case $param_maiusculo in 	# estrutura de repetição 'case', caso o '$param_maiusculo' for igual algum termo então ele executara o comando.
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
		
	*)	#'*' representa qualquer termo que não seja os já descrito no 'case'
	echo "O parametro passado não e valido"
	;;
esac	#fechar o 'case'
	
