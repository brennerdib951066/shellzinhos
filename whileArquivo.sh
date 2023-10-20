#!/usr/bin/env bash

# while IFS= read linha; do
#     [[ "${linha}" = "brenner" ]] && { echo "$((i++)) ${linha} é o mais bonito" ;}\
#     || echo "$((i++)) ${linha}"
# done < arquivo.txt
#
# echo "Total De linhas= $((i))" # While

TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
while :; do
    echo "$1"
    sleep 2s
    { curl -s -F'chat_id'="739901623" -F'text'="$1" -F'parse_mode'=Markdown https://api.telegram.org/bot$TOKEN/sendMessage &>- ; echo "Deu certo!" ;} || echo "Algo deu errado!"
    shift
    [[ "$1" ]] && continue || break
done

fim="fim de papo"

echo "${fim^^}"
