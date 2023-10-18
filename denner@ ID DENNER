#!/usr/bin/env bash

vermelho="[033\31[1m"
buracoNegro="/dev/null"

select menu in "Abrir Gedit" "Abrir Chrome" "Abrir Barrier" "Abrir Calendário"; do
            case "$menu" in
                        "Abrir Gedit") echo "Escolheu \033[32;1m$menu\033[m"             ;;
                        "Abrir Chrome") google-chrome --profile-directory="Profile 2" "https://bubble.io/page?name=index&id=viverbemseguroscrm&tab=tabs-1" "https://www.sistemaviverbemseguros.com/version-test" "https://bubble.io/page?type=page&name=index&id=viverbemseguroscrm&tab=tabs-3&subtab=Data+Types&type_id=avisosdeatualizacao" 2>"$buracoNegro" >"$buracoNegro"                    &  ;;
                        "Abrir Barrier") barrier 2>"$buracoNegro" >"$buracoNegro"                                                                                                &  ;;
                        "Abrir Calendário") gnome-calendar %U                                                                                                                    &  ;;
                        *) echo "Opah! Opção não existe!"             ;;
            esac
done




