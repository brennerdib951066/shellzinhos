#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################



##########################################################
read -p $'\E[38;1mNota 1\E[m:   ' nota1
read -p $'\E[38;1mNota 2\E[m:   ' nota2

media="${nota1}"+"${nota2}"/2

if ((media>=7));then
    echo "scale=2 ;${media}" | bc
    echo  $'\E[32;1mAprovado\E[m'
elif ((media>5&&media<7)); then
    echo "scale=2 ;${media}" | bc
    echo $'\E[35;1mEm recuperação\E[m'
else
    echo "scale=2 ;${media}" | bc
    echo $'\E[31;1mREPROVADO\E[m'
fi
