#!/usr/bin/env bash

arquivoEntrada="bibliotecas/gitHub.txt"
mapfile -t arquivoArray < "$arquivoEntrada"

echo -e "\E[31;1mArquivo Array ${arquivoArray[0]}\E[m"

i="0"
for incremento in "${arquivoArray[@]}"; do
	read recebeArray[$i] <<<"${incremento}"
	echo "${recebeArray[i]}"
	eval "${recebeArray[i]}"
	((i++))
done


