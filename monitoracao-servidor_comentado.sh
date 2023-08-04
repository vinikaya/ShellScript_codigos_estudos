#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost) #comando pega uma resposta do servidor previamente instalado e configurado, no caso pega o status "http_code".

if [ $resposta_http -ne 200 ]	#caso o 'http_code' seja diferente de 200 então é porque deu um erro e execulta os comandos abaixo.
then				#Para enviar email pelo script foi baixado dois programas ssmtp e mailutil, foi configurado o arquivo /etc/ssmtp/ssmtp.conf como root e colocado o email e que ira enviar a mensagem, porta, senha e etc, o programa mailutil é o utilizado na linha 6.
mail -s "Problema no servidor apache2" viniciuskaya87@gmail.com<<del   
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web.
del						
	systemctl restart apache2   # caso o http_code sejá diferente de 200 irá enviar o email e rodar o comando a cima para reiniciar o servidor.
fi

