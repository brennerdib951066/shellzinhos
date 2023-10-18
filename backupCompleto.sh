#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
diretorioDoBackup="/home/brenner/Downloads"
diretorioRecebidor="/mnt/backup"
data="$(date +%d-%m-%Y)"
nomeArquivo="backup-${data}.tar.gz"
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
idChat="213289248"
#fluxo="2521075"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/"${idChat}"/send_message/"
conteudo="Backup Realizado com sucesso"
##########################################################

##########################
#    Verificacao inicial
((UID>0)) && { echo -e $'\E[31;5mPrecisa de sudo\E[m'; sleep 3s; exit 1 ;}

##########################
if ! mountpoint -q -- "${diretorioRecebidor}"; then
        conteudo="Falha no backup" ### Alterando o conteudo da variavel
        curl -X POST -H "API-KEY: ${chaveApi}" -H "Content-Type: application/json" -d "{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}"
        exit 1
else
        # Enviando o backup
        if tar -czSpf "${diretorioRecebidor}/${nomeArquivo}" "${diretorioDoBackup}"; then
            curl -X POST -H "API-KEY: ${chaveApi}" -H "Content-Type: application/json" -d "{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}"
        fi
fi
