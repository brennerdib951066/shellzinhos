#!/bin/bash


echo "Cole sua URL youtube aqui!"
read baixar
echo "Agora escolha seu diretorio onde deseja salvar o downloads"
read diretorio

yt-dlp -f mp4 -o "$diretorio/%(title)s.%(ext)s" $baixar

read -p "Gostaria de converter os arquivos para MP3[S/n]?" confirmar
echo "Perfeito!"
read -p "Deseja criar uma pasta para esses arquivos[S/n]?" criarPasta
read -p "Escreva o nome da pasta que deseja criar para a pasta" nomePasta


if [[ "$criarPasta" = "S" ]]; then
        read -p "Escreva o caminho onde deseja criar a pasta" caminhoPasta
        pastaAtual="$(pwd)"
        variavelPasta=$(mkdir "$caminhoPasta" "$nomePasta")

else
        echo "Obrigado"
        exit 1

fi

case "$confirmar" in
        S| s| n) source converter.txt  ;;
        N| n | Ñ) echo "Beleza até mais"
esac
