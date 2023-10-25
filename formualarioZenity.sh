#!/usr/bin/env bash

nomeInput="Qual seu nome"
sobrenomeInput="Qual seu sobre nome"
telefoneInput="Telefone"
senhaInput="Senha"
emailInput="Email"
tituloCadastro="Cadastro De Funcionário"
textoCadastro="cadastro"
novosDados=()
tituloTipoDeEquipeLista="tipos de equipes"
textoTipoDeEquipeLista="selecione uma das equipes para prosseguir"
opcaoTipoDeEquipeLista=("B8 (Taguantiga Tarde)" "B9 (Cidade Jardins Tarde)" "B10 (Cidade Jardins Tarde)" "B11 (Cidade Jardins Tarde)" "B12 (Cidade Jardins Manhã)" "B13 (Cidade Jardins Manhã)" "B14 (Jardim Oriente Manhã)" "B15 (Jardim Oriente Manhã)" "B16 (Jardim Oriente Tarde)" "B17 (Jardim Oriente Tarde)" "B18 (Taguatinga Manhã)" "M3  (Contagem Tarde)" "M4  (Contagem Tarde)" "M6  (Minas Manhã)" "G1  (Goiânia Tarde)" "P2   (Calebe)" "Pos Vendas (Valparaiso))")
tituloPeriodoLista="tipos de equipes"
tituloPeriodoLista="selecione um periodo"
opcaoPeriodoLista=("manha" "tarde")
tituloCargoLista="cargo comercial"
textoCargoLista="Selecione um cargo"
opcaoCargoComercialLista=("Gerente" "Supervisor" "Colaborador" "Admin Geral" "cabecaCesar")

#######################################VARIAVEIS PARA GRAVAR OS DADOS RECEBIDOS PELA ENTRADA################################
function notificarErro(){
	local nivel="critical"
	local tempo="5000"
    local cabecalho="Erro"
    local conteudo="Erro fatal ao tentar fazer a operacao"
	notify-send -u "${nivel}" -t "${tempo}" "${cabecalho}" "${conteudo}"
}

function notificarSucesso(){
	local nivel="normal"
	local tempo="5000"
    local cabecalho="Sucesso"
    local conteudo="Operação realizada com sucesso"
	notify-send -u "${nivel}" -t "${tempo}" "${cabecalho}" "${conteudo}"
}

function receberDadosInputs(){
dadosInputs=$(zenity --title="${tituloCadastro}" --text="${textoCadastro}" --forms --add-entry="${nomeInput}"\
        --forms --add-entry="${sobrenomeInput}"\
        --forms --add-entry="${emailInput}"\
        --forms --add-entry="${senhaInput}"\
        --forms --add-entry="${telefoneInput}"\
        --separator=',')
 }
receberDadosInputs ###Chamando a função receberDadosInputs
novosDados=${dadosInputs//,/ }

dadosTipoDeEquipe=$(zenity --list --title="${tituloTipoDeEquipeLista^^}" --text="${textoTipoDeEquipeLista^}" --column="Equipes:" "${opcaoTipoDeEquipeLista[@]}")
dadosPeriodo=$(zenity --list --title="${tituloPeriodoLista^^}" --text="${textoPeriodoLista^}" --column="Periodo" "${opcaoPeriodoLista[@]}")
dadosCargo=$(zenity --list --title="${tituloCargoLista^^}" --text="${textoCargoLista^}" --column="Cargo" "${opcaoCargoComercialLista[@]}")

#echo "${dadosTipoDeEquipe}"
#echo "${dadosPeriodo}"
#echo "${dadosCargo}"

###################################Retirando o delimitador virgula para o read receber como array os dadosInputs
novosDados=${dadosInputs//,/ }
read -a novosDados <<<"${novosDados}"
##########################################################################################################################
echo "${#novosDados[@]}"

########################################Mandando a requisao para cadastrar no bubble######################################
if ! curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/api/1.1/obj/User/" -d "{\"Nome\": \"${novosDados[0]} ${novosDados[1]}\",\"email\": \"${novosDados[2]}\",\"password\": \"${novosDados[3]}\",\"cargoComercial\":\"${dadosCargo}\",\"telefoneComercial\":\"${novosDados[4]}\",\"tipoDeEquipe\":\"${dadosTipoDeEquipe}\",\"periodoComercial\":\"${dadosPeriodo}\"}" &>- ; then

        notificarErro ###Chamando a função notificarErro

else
        curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/User/" -d "{\"Nome\": \"${novosDados[0]} ${novosDados[1]}\",\"email\": \"${novosDados[2]}\",\"password\": \"${novosDados[3]}\",\"cargoComercial\":\"${dadosCargo}\",\"telefoneComercial\":\"${novosDados[4]}\",\"tipoDeEquipe\":\"${dadosTipoDeEquipe}\",\"periodoComercial\":\"${dadosPeriodo}\"}" &>-
        echo "$?"
        notificarSucesso ###Chamando a função notificarSucesso
fi





########################################################################################################################


