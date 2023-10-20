#!/usr/bin/env bash

##############variaveis do programa###############
pastaScripts="$HOME/Área de Trabalho/scripts"
pastaPython="$HOME/Área de Trabalho/pythons"
abrirCorVermelhar="\E[31;1m"
fecharCor="\E[m"
chave=1 ##### 0 é desligdo 1 é ligado
erro='chave desativada no momento'
nomeDoArquivo="Nome do Arquivo:"
#################################################

###############Verificacoes###########################################
(($UID==0)) && { echo 'Tu é besta é? Saindo...'; sleep 1s ; exit 1 ;}

#######################################################################
if ((chave>0)); then
function menuPrincipal(){
PS3=$'\E[37;1mEscolha Alguma Das Opções:\E[m  '
select menu in "SH" "Python"; do
    case $REPLY in
        1) echo -e "\n";\
         break;;
        2) echo -e "\n";\
         break;;
    esac
done
}
menuPrincipal                                     #Chamando a função menuPrincipal
function criarArquivosScripts(){
    until false; do
    echo -e "${abrirCorVermelhar}${nomeDoArquivo}${fecharCor}"
        read nomeArquivoSH
        [[ "$nomeArquivoSH" ]] && break || continue
    done
        >"${pastaScripts}/$nomeArquivoSH.sh" && chmod +x "${pastaScripts}/$nomeArquivoSH.sh"\
        &&\
        cat>>"${pastaScripts}/$nomeArquivoSH.sh"<<EOF
#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################



##########################################################
EOF
        kate "${pastaScripts}/$nomeArquivoSH.sh" &>- &
        clear

}
((REPLY==1)) && criarArquivosScripts                      #Chamando a função criarArquivosScripts

function criarArquivosPython3(){
    until false; do
    echo -e "${abrirCorVermelhar}${nomeDoArquivo}${fecharCor}"
        read nomeArquivoPY
        [[ "$nomeArquivoPY" ]] && break || continue
    done
        >"${pastaPython}/$nomeArquivoPY.py" && chmod +x "${pastaPython}/$nomeArquivoPY.py"\
        &&\
        cat>>"${pastaPython}/$nomeArquivoPY.py"<<EOF
#!/usr/bin/env python3

####################VARIAVEIS DO PROGRAMA##################



##########################################################
EOF
        kate "${pastaPython}/$nomeArquivoPY.py" &>- &
        clear
}
((REPLY==2)) && criarArquivosPython3                   #Chamando a função criarArquivosPython3
else
    #echo "A chave está desligada no momento"
    notify-send -u 'normal' -t '5000' 'Erro De Chave' "${erro^^}"
fi
