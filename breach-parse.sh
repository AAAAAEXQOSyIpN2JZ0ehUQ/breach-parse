#!/usr/bin/env bash

#====================================================
#   SCRIPT:                   Breach Parse
#   DESARROLLADO POR:         Heath Adams (hmaverickadams)
#   ACTUALIZADO POR:          Jony Rivera (Dzhoni)
#   FECHA DE ACTUALIZACIÓN:   19-10-2024 
#   CONTACTO POR TELEGRAMA:   https://t.me/Dzhoni_dev
#   GITHUB OFICIAL:           https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse
#====================================================

# Paleta de colores
reset="\033[0m"       # Restablecer todos los estilos y colores
bold="\033[1m"        # Texto en negrita
green="\033[0;32m"    # Verde
red="\033[0;31m"      # Rojo
yellow="\033[0;33m"   # Amarillo
magenta="\033[0;35m"  # Magenta
cyan="\033[0;36m"     # Cian
white="\033[0;37m"    # Blanco

# Iconos
checkmark="${white}[${green}+${white}]${green}"
error="${white}[${red}-${white}]${red}"
info="${white}[${yellow}*${white}]${yellow}"
process="${white}[${magenta}>>${white}]${magenta}"
indicator="${red}=>${cyan}"

# Verificación de dependencias
function check_dependencies() {
    local dependencies=("grep" "awk" "find" "xargs")
    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo -e "${error} Dependencia faltante: ${dep}. Por favor, instálala antes de continuar."
            exit 1
        fi
    done
}

# Verificar dependencias
check_dependencies

# Verificar si el directorio output existe y eliminarlo
if [ -d "output" ]; then
    echo -e "\n${info} Eliminando archivos existentes en output..."
    rm -rf output
fi

# Parámetros iniciales
breachDataLocation="/opt/breach-parse/BreachCompilation/data"

# Manejo de argumentos
if [ $# -lt 2 ]; then
    echo -e "${error} Uso: $0 <dominio a buscar> <archivo base de salida> [ubicación de datos de brechas]"
    echo -e "${info} Ejemplo: $0 @gmail.com gmail"
    exit 1
fi

# Definir las ubicaciones de salida
search_domain=$1
output_base=${2%.txt} # Eliminar la extensión .txt si existe

# Directorio de salida
output_dir="output"
mkdir -p "$output_dir" # Crear el directorio si no existe

# Verificar ubicación de datos de brechas si se proporciona
if [ $# -eq 3 ]; then
    breachDataLocation="$3"
    if [ ! -d "$breachDataLocation" ]; then
        echo -e "${error} El directorio ${breachDataLocation} no existe."
        exit 1
    fi
fi

# Definir archivos de salida dentro del directorio "output"
master="${output_dir}/${output_base}-master.txt"
users="${output_dir}/${output_base}-users.txt"
passwords="${output_dir}/${output_base}-passwords.txt"

# Limpiar archivos anteriores
> "$master"
> "$users"
> "$passwords"

echo -e "${process} Iniciando búsqueda en ${breachDataLocation}..."

# Buscar de manera paralela
find "$breachDataLocation" -type f -print0 | xargs -0 -P 4 -I {} grep -aEH "$search_domain" {} | sort -u > "$master"

# Dividir resultados en usuarios y contraseñas
echo -e "${info} Extrayendo nombres de usuario..."
awk -F':' '{print $1}' "$master" | sort -u > "$users"

echo -e "${info} Extrayendo contraseñas..."
awk -F':' '{print $2}' "$master" | sort -u > "$passwords"

# Generar reporte en formato HTML
echo -e "${info} Generando reporte HTML..."
{
    echo "<html><body><h1>Reporte de Breach Parse</h1><pre>"
    cat "$master"
    echo "</pre></body></html>"
} > "${output_dir}/${output_base}-report.html"

# Mostrar mensaje de finalización
echo -e "${checkmark} Proceso completado. Archivos generados en el directorio 'output':\n"
echo -e "${cyan}  - ${output_base}-master.txt"
echo -e "  - ${output_base}-users.txt"
echo -e "  - ${output_base}-passwords.txt"
echo -e "  - ${output_base}-report.html${reset}\n"
