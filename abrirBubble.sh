#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
urls=("https://bubble.io/page?name=index&id=viverbemseguroscrm&tab=tabs-1" "https://www.sistemaviverbemseguros.com/version-test" "https://bubble.io/page?type=page&name=index&id=viverbemseguroscrm&tab=tabs-3&subtab=Data+Types&type_id=avisosdeatualizacao")


##########################################################
DISPLAY=:0 google-chrome-stable --profile-directory="Profile 2" "${urls[@]}" &>- &
echo "${urls[@]}"
