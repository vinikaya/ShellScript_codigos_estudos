#!bin/bash

cd ~/Área\ de\ Trabalho/Estudos_Linux

converte_txt(){
for arquivo in *
do
	ext=${arquivo##*.}
	if [ $ext != "txt" ]
	then
		arquivo_ext=$(ls $arquivo | awk -F. '{ print $1 }')
		mv $arquivo $arquivo_ext.txt
		echo "O arquivo $arquivo foi alterado para .txt"
	fi
done
}
converte_txt
if [ $? -eq 0 ]
then
	echo "Todos os arquivos foram convertidos para .txt"
else
	echo "Ocorreu um erro no codigo"
fi
