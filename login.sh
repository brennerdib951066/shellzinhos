#!/usr/bin/env bash 

#Variaveis de credenciais

nomeUser="Brenner"
credencial="12345"

tempoExedido="tempo exedido"
erroCredenciais="Sua(s) credêncial(s) esta(o) invalido(s)"

#começando o script com as verificações

function logar(){
        echo -e "Bem vindo ao programa\nTeras 4 segundos para digitar as credenciais"
        sleep 3s
        read -t 4 -p "login: " login && read -t 4 -sp "Senha:  " senha &&
        if [[ "$login" = "$nomeUser" ]] && [[ "$senha" -eq  "$credencial" ]]; then
                echo -e "logado!"
        { echo -e "\033[37;1mVerificando o ambiente...\033[m" ; sleep 1s ;}
        else
                echo -e "\n\033[31;1m$erroCredenciais\033[m"
                exit 1
        fi || { echo -e "\033[31;1m"$tempoExedido"\033[m"; exit 1 ;}

        echo -e "\033[34;1mEscolha uma das opçoes\033[m"
        echo -e "\033[33;1m\033[1m"
        #Criando uma variavel local para adicionar no select
local   opcaoLista=("Abrir chrome" "Abrir Telegram" "Abrir Planilha" "Abrir Sublime" "Discover" "VirtualBox" "Partição")
        PS3="Escolha uma das opções  " #Variavel seria tipo o echo
        select menu in "${opcaoLista[@]}"; do
                
                case "$REPLY" in # REPLY Servi para buscar por numero em vez de textos
                        "1") google-chrome                         &      ;;
                        "2") env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/telegram-desktop_telegram-desktop.desktop\ 
                        /snap/bin/telegram-desktop -- %u           &      ;;
                        "3") /usr/bin/env libreoffice              &      ;;
                        "4") env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/sublime-text_subl.desktop\ 
                        /snap/bin/sublime-text.subl %F             &      ;;
                        "5") plasma-discover %F                    &      ;;
                        "6") VirtualBox %U                         &      ;;
                        "7") partitionmanager                      &      ;;
                        *) echo "Nao existe essa opcao"                   ;;
                esac

        done
}

function help(){
        echo "====================================================="
        echo -e "\033[31;1mPara usar o sript use um desses parametros:\033[m"
        echo -e "\033[38;1m-l ou --login para usar basta digitar as credenciais\033[m"
        echo -e "\033[38;1m-h ou --help para ajuda em geral\033[m"
        echo "====================================================="
}

case "$1" in
        -l|--login) logar   ;; # Chamando a funcao logar
        -h|--help) help     ;; # Chamando a funcao help
        *) echo "Caso precise de ajuda digite -h ou --help"
esac