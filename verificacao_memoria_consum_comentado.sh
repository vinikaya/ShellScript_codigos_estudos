#1/bin/bash

memoria_total=$( free | grep -i mem | awk '{print $2}' )  #Pega a memoria ram total e salva na variavel.
memoria_consumida=$( free | grep -i mem | awk '{print $3}' ) #Pega a memoria ram Utilziada e salva na variavel.

relacao_memoria_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')  #Faz a diferença entre as duas memorias e salva na variavel.

echo $relacao_memoria_total 

if [ $relacao_memoria_total -gt 50 ]  # compara o valor da relação entre as memorias e se for maior que 50(valor solicitado) ele enviara um email informando.
then
mail -s "Consumo de memoria acima do limite" viniciuskaya87@gmail.com<<del 
O consumo de memoria está acima do limite especificado. Atualmente o comsumo é de: $(free -h | grep -i mem | awk '{ print $3 }')
del
fi
