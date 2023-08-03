#!/bin/bash

converte_imagem(){ 
	local caminho_imagem=$1
	local imagem_sem_ext=$(ls $caminho_imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_ext.jpg $imagem_sem_ext.png
}

varrer_diretorio(){
	cd $1
	for arquivo in *  #para fazer uma varredura em todos os arquivos.
	do
		caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)  #para imprimir o caminho completo do arquivo/diretorio.
		if [ -d $caminho_arquivo ]  #caso o caminho impresso seja um diretorio então execultara o then e se for arquivo o else.
		then
			varrer_diretorio $caminho_arquivo	# chama novamente essa função com o caminho do subdiretorio e faz uma nova varredura.
		else
			converte_imagem $caminho_arquivo #chama a função converter para converter todas as imagens do diretorio.
		fi
	done
}

varrer_diretorio ~/Downloads/imagens-novos-livros #chama a função e passa como parametro o caminho da pasta no qual sera feito a conversão dos arquivos.
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "houve um problema na conversão"
fi

