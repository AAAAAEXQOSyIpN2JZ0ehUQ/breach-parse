#!/bin/bash

#====================================================
#   SCRIPT:                   Install Breach Parse
#   DESARROLLADO POR:         Heath Adams (hmaverickadams)
#   ACTUALIZADO POR:          Jony Rivera (Dzhoni)
#   FECHA DE ACTUALIZACIÓN:   19-10-2024 
#   CONTACTO POR TELEGRAMA:   https://t.me/Dzhoni_dev
#====================================================

# Paleta de colores
reset="\033[0m"       # Restablecer todos los estilos y colores
green="\033[0;32m"    # Verde
red="\033[0;31m"      # Rojo

# Verificar si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${red}Error: Para instalar, por favor ejecuta como root (uid 0).${reset}"
    exit 1
fi

# Verificar si el archivo de origen existe
if [ ! -f "./breach-parse.sh" ]; then
    echo -e "${red}Error: El archivo 'breach-parse.sh' no se encuentra en el directorio actual.${reset}"
    exit 1
fi

# Copiar el script a /usr/local/bin/
cp ./breach-parse.sh /usr/local/bin/breach-parse

# Verificar si la copia fue exitosa
if [ $? -eq 0 ]; then
    echo -e "${green}Instalación completada con éxito. Uso: breach-parse${reset}"
else
    echo -e "${red}Error: Falló la instalación.${reset}"
    exit 1
fi
