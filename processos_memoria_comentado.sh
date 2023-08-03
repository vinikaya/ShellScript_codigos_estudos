#!bin/bash


if [ ! -d log ]  #se não tem um diretorio chamado 'log' então sera criado um.
then
	mkdir log #criação do diretorio.
fi

processos_memoria(){   
	processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])  #ps - processos do sistema somente numero e o PID ordenado pelo tamanho, head - somente os 11 primeiros termos, grep [0-9] - somente termos que contenham numeros(usado para eliminar cabeçalho).
	for pid in $processos 	#loop dos numeros salvos em 'processos' usando a variavel 'pid'.
	do
		nome_processo=$(ps -p $pid -o comm=) 	#esse comando pega o numero do processo salvo em 'pid' e imprimi o nome do mesmo.
		echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log		# -n não pular linha, imprimi a data da hora da execução do codigo no formato descrito no arquivo '$nome_processos.log' dentro da pasta log.
		tamanho_processo=$(ps -p $pid -o size | grep [0-9]) 	#pega o numero do processo salvo em 'pid' e mostra somente o tamanho, grep serve para mostrar só o numero e não o cabeçalho.
		echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log	#o comando bc faz contas matematicas no terminal e com o scale=2 mostra dois decimais, essa conta divide por 1024 para saber o tamanho em MB, >> serve para imprimir no arquivo 'nome_processos.log' dentro da pasta 'log'.
	done
}
processos_memoria #chama a função
if [ $? -eq 0 ] #verifica o status de saida da função usanado o descritor 0.
then	
	echo "Arquivos salvos com sucesso"
else
	echo "houve falha no processo"
fi
