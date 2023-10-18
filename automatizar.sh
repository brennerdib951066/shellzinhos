#!/usr/bin/env bash

#Buscando dados na pasta
source="testApps"


case "$1" in
        ft| FT| fisicaT) cadastrarFisicaTarde ;;
        fm| FM| fisicaM) cadastrarFisicaManha ;;
        p|P| pme) cadastroPME         ;;
        M|m|ME) minhasEtiquetas       ;;
        *) echo "Opah não existe essa opção"
esac
