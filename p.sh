#!/usr/bin/env bash

mapfile -t buscar < "localMouse.txt"
auto="xdotool mousemove"
autoTipo="key type Titularidade"
for posicao in "${buscar[@]}"; do
    sleep 1.5s
    eval ${auto} ${posicao} click 1 ${autoTipo}

done
