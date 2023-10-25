#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
diretorioDoBackup="/home/brenner/Área de Trabalho"
diretorioRecebidor="/mnt/backup"
montar="/dev/sde1"
montar2='/media/brenner/00a5a660-c690-4862-b7cb-5cb7dab6fd33'
data="$(date +%d-%m-%Y)"
nomeArquivo="backup-${data}.tar.gz"
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
idChat="213289248"
#fluxo="2521075"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/"${idChat}"/send_message/"
conteudo="Backup Realizado com sucesso"
xDias="2"
chaveDelete="1" # 1(um) Ligado 0(zero) desligado
##########################################################

##########################
#    Verificacao inicial
((UID>0)) && { echo -e $'\E[31;5mPrecisa de sudo\E[m'; echo "CHAUUUU..."; while ((i==3)); do echo "${i}";((i++)); done ;}

function backup(){
if tar -czSPpf "${diretorioRecebidor}/${nomeArquivo}" "${diretorioDoBackup}"; then
        curl -X POST -H "API-KEY: ${chaveApi}" -H "Content-Type: application/json" -d "{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}"
        exit 0
fi

}

##########################Verificando se esta montado###############
if ! mountpoint -q -- "${diretorioRecebidor}"; then
        mount "${montar2}" "${diretorioRecebidor}"
        backup
else
        backup
fi
if [ "${chaveDelete}" = "1" ]; then
        conteudo="Arquivos com + de 2 dias deletados com sucesso!"
        find "${diretorioRecebidor}" -mtime "+${xDias}" -delete
        curl -X POST -H "API-KEY: ${chaveApi}" -H "Content-Type: application/json" -d "{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}"
        exit 0
fi
