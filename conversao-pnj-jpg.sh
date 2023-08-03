#!/bin/bash


converte_imagem(){
cd ~/Imagens/Capturas_de_tela

if [ ! -d png ] #verifica se existe o diretorio chamado 'png'
then
	mkdir png 
fi

for imagem in *.png  #loop que pega cada imagem e execulta um codigo depois do 'do'
do
	local image_ext=$(ls $imagem | awk -F. '{ print $1 }') #imprimi o nome do arquivo sem o conteudo após o '.' o atributo awk faz isso.
	convert $image_ext.png png/$image_ext.jpg  #converte a imagem na pasta'png' com a nova extensão.
done
}	
converte_imagem 2>erros_conversao.txt  #chama a função e manda o codigo de erro para o arquivo de texto, para n aparecer para o usuario final caso tenha errao.
if [ $? -eq 0 ]     #faz a verificação do status de saida da função, caso seja igual a 0 é porque foi execultado com sucesso. se for diferente é pq deu erro.
then
	echo "conversão realizada com sucesso"
else 
	echo "houve uma falha no processo"
fi
