#!/bin/bash

ROJO="\e[31m"
MAGENTA="\e[35m"
RESET_COLOR="\e[0m"

# Verificar si pactl está disponible
if ! command -v pactl &> /dev/null; then
    echo -e "${ROJO}El comando 'pactl' no está instalado.${RESET_COLOR}"
    echo -e "${MAGENTA}Intentando instalar 'pulseaudio-utils'...${RESET_COLOR}"
    sudo apt update
    sudo apt install -y pulseaudio-utils

    if ! command -v pactl &> /dev/null; then
        echo -e "${ROJO}No se pudo instalar 'pactl'. Abortando.${RESET_COLOR}"
        exit 1
    fi
fi

echo -n -e "${MAGENTA}Buscando salidas de audio actuales "
for i in {0..30}
do
	echo -n "."
	sleep 0.05
done
echo -e ".${RESET_COLOR}"

contador_intentos=0 #Llevamos un conteo de errores para limitarlo a 3 máximo
while true; do
	# Instrucciones para listado de salidas de audio
	pactl list short sinks
	echo -n -e "${MAGENTA}Selecciona la salida que deseas ingresando su indentificador númerico: ${RESET_COLOR}"
	read audio_out

	if [[ "$audio_out" =~ ^[0-9]+$ ]]; then
		# Seteamos la salida de audio escogida por el usuario
		# Confirmado la salida de audio actual
		pactl set-default-sink $audio_out
		pactl list short sinks
		break
	else
		((contador_intentos++))
		echo -e "${ROJO}No es una opción válida. Error número: ${contador_intentos}  ${RESET_COLOR}"
		if [[ $contador_intentos -gt 2 ]]; then
			echo -e "${ROJO}LIMITE DE ERRORES ALCANZADOS${RESET_COLOR}"
			break
		fi
	fi
done
