#!/usr/bin/env bash
#====================================================
#   SCRIPT:                   Breach Parse
#   DESARROLLADO POR:         Heath Adams (hmaverickadams)
#   ACTUALIZADO POR:          Jony Rivera (Dzhoni)
#   FECHA DE ACTUALIZACIÃ“N:   08-09-2024 
#   CONTACTO POR TELEGRAMA:   https://t.me/Dzhoni_dev
#   GITHUB OFICIAL:           https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse
#====================================================

# Paleta de colores
reset="\033[0m"       # Restablecer todos los estilos y colores
bold="\033[1m"        # Texto en negrita
italic="\033[3m"      # Texto en cursiva
underline="\033[4m"   # Texto subrayado
blink="\033[5m"       # Texto parpadeante
reverse="\033[7m"     # Invertir colores de fondo y texto
hidden="\033[8m"      # Texto oculto (generalmente invisible)

# Colores de texto
black="\033[0;30m"     # Negro
red="\033[0;31m"       # Rojo
green="\033[0;32m"     # Verde
yellow="\033[0;33m"    # Amarillo
blue="\033[0;34m"      # Azul
magenta="\033[0;35m"   # Magenta
cyan="\033[0;36m"      # Cian
white="\033[0;37m"     # Blanco

# Colores de fondo
bg_black="\033[0;40m"     # Fondo Negro
bg_red="\033[0;41m"       # Fondo Rojo
bg_green="\033[0;42m"     # Fondo Verde
bg_yellow="\033[0;43m"    # Fondo Amarillo
bg_blue="\033[0;44m"      # Fondo Azul
bg_magenta="\033[0;45m"   # Fondo Magenta
bg_cyan="\033[0;46m"      # Fondo Cian
bg_white="\033[0;47m"     # Fondo Blanco

# Iconos v3
checkmark="${white}[${green}+${white}]${green}"
error="${white}[${red}-${white}]${red}"
info="${white}[${yellow}*${white}]${yellow}"
unknown="${white}[${blue}!${white}]${blue}"
process="${white}[${magenta}>>${white}]${magenta}"
indicator="${red}==>${cyan}"

# Barra de separaciÃ³n
barra="${blue}|--------------------------------------------|${reset}"
bar="${yellow}----------------------------------------------${reset}"


if [ $# -lt 2 ]; then
    echo -e "${error} Breach-Parse v2: A Breached Domain Parsing Tool by Heath Adams"
    echo -e "${info} Uso: ./breach-parse.sh <dominio a buscar> <archivo de salida> [ubicación de datos de brechas]"
    echo -e "${info} Ejemplo: ./breach-parse.sh @gmail.com gmail.txt"
    echo -e "${info} Ejemplo: ./breach-parse.sh @gmail.com gmail.txt \"~/Downloads/BreachCompilation/data\""
    exit 1
else
    if [ $# -ge 4 ]; then
        echo -e "${error} Has suministrado más de 3 argumentos. Asegúrate de poner entre comillas tus cadenas:"
        echo -e "${info} Ejemplo: ./breach-parse.sh @gmail.com gmail.txt \"~/Downloads/Temp Files/BreachCompilation\""
        exit 1
    fi

    # Asumir ubicación predeterminada
    breachDataLocation="/opt/breach-parse/BreachCompilation/data"
    if [ $# -eq 3 ]; then
        if [ -d "$3" ]; then
            breachDataLocation="$3"
        else
            echo -e "\n${error} No se pudo encontrar un directorio en ${3}"
            exit 1
        fi
    else
        if [ ! -d "${breachDataLocation}" ]; then
            echo -e "\n${error} No se pudo encontrar un directorio en ${breachDataLocation}"
            exit 1
        fi
    fi

    # Establecer nombres de archivos de salida
    fullfile=$2
    fbname=$(basename "$fullfile" | cut -d. -f1)
    master=$fbname-master.txt
    users=$fbname-users.txt
    passwords=$fbname-passwords.txt

    # Limpiar cualquier archivo existente para evitar acumulación de datos anteriores
    > $master
    > $users
    > $passwords

    total_Files=$(find "$breachDataLocation" -type f -not -path '*/\.*' | wc -l)
    file_Count=0

    function ProgressBar() {
        let _progress=$(((file_Count * 100 / total_Files * 100) / 100))
        let _done=$(((_progress * 4) / 10))
        let _left=$((40 - _done))

        _fill=$(printf "%${_done}s")
        _empty=$(printf "%${_left}s")

        printf "\n\r${indicator} Progreso : [${_fill// /\#}${_empty// /-}] ${_progress}%%"
    }

    echo -e "\n${process} Buscando contraseñas..."
    find "$breachDataLocation" -type f -not -path '*/\.*' -print0 | while read -d $'\0' file; do
        # Usar grep y eliminar duplicados en tiempo real antes de guardar en el archivo maestro
        grep -a -E "$1" "$file" | sort -u >> $master
        ((++file_Count))
        ProgressBar
    done

    sleep 1
    echo -e "\n\n${info} Extrayendo nombres de usuario..."
    awk -F':' '{print $1}' $master | sort -u > $users  # Eliminar duplicados

    sleep 1
    echo -e "${info} Extrayendo contraseñas..."
    awk -F':' '{print $2}' $master | sort -u > $passwords  # Eliminar duplicados
    echo -e "${checkmark} Extracción completada.${reset}\n"
    exit 0
fi
