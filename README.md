![logo](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse/blob/master/Imagenes/breach-parse.png)

# Findips :octocat:

## :information_source: Descripci�n
Breach-Parse v2: Herramienta de Parsing de Dominios Comprometidos

Este es un script de Bash dise�ado para extraer credenciales de archivos filtrados en grandes colecciones de bases de datos de breaches. Automatiza el proceso de b�squeda de dominios espec�ficos dentro de la Breach Compilation.

## :computer: Instalaci�n
```bash
cd /opt
sudo git clone https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse
cd breach-parse
sudo chmod +x cd breach-parse/*
cd breach-parse
sudo ./install.sh
ls -lthas
```

Descarga la lista de contrase�as violadas desde magnet, que se encuentra aqu�:

: `magnet:?xt=urn:btih:7ffbcd8cee06aba2ce6561688cf68ce2addca0a3&dn=BreachCompilation&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fglotorrents.pw%3A6969&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337`

Si no almacena la lista de contrase�as (BreachCompilation) en `/opt/breach-parse`, especifique la ubicaci�n de la siguiente manera:

`breach-parse @gmail.com gmail.txt "~/Downloads/BreachCompilation/data"`

Ejecute `breach-parse` para obtener instrucciones
## :rocket: Modo de Uso

?? Ejemplos de B�squeda para "hacker"

?? B�squeda en un dominio espec�fico (por ejemplo, Gmail):
```bash
./breach-parse.sh "@gmail.com" gmail.txt; cat gmail-master.txt | grep -i "hacker"
```

?? B�squeda en m�ltiples dominios:
```bash
./breach-parse.sh "@yahoo.com|@hotmail.com" multiple.txt; cat multiple-master.txt | grep -i "hacker"
```

?? B�squeda en un dominio espec�fico con archivo de salida personalizado:
```bash
./breach-parse.sh "@example.com" example.txt; cat example-master.txt | grep -i "hacker"
```

?? B�squeda de un usuario espec�fico (por ejemplo, admin) en un dominio:
```bash
./breach-parse.sh "@example.com" example.txt
cat example-master.txt | grep -i "admin" | grep -i "hacker"
```

?? B�squeda en un archivo existente:
```bash
cat existing_file.txt | grep -i "hacker"
```

??? B�squeda en un dominio espec�fico y luego en un archivo maestro:
```bash
./breach-parse.sh "@live.cn" live.txt; cat live-master.txt | grep -i "hacker"
```

?? B�squeda de "hacker" en una lista de m�ltiples dominios:
```bash
./breach-parse.sh "@toyota.de|@live.cn" multiple.txt; cat multiple-master.txt | grep -i "hacker"
```

## :bookmark_tabs: Notas

- El script busca archivos en la ubicaci�n de la Breach Compilation y extrae coincidencias de correos electr�nicos y contrase�as para el dominio proporcionado.
- La salida incluye usuarios y contrase�as en archivos separados.
- Para evitar problemas con espacios en las rutas, aseg�rate de usar comillas dobles donde sea necesario.

## :star2: Caracter�sticas 

- Colores e Iconos: El script muestra el progreso y resultados utilizando colores y s�mbolos para una mejor visualizaci�n.
- Barra de progreso: Durante el an�lisis, muestra el avance del procesamiento de los archivos.
- Extracci�n autom�tica: Se generan archivos separados para usuarios y contrase�as extra�dos.
- Prevenci�n de duplicados: El script filtra autom�ticamente los duplicados para evitar resultados repetidos.

## :hammer_and_wrench: Requisitos 

- Sistema Operativo: Linux/Unix
- Dependencias: Bash, grep, awk

## :open_file_folder: Estructura del Repositorio

| Icono            | Nombre              | Descripci�n                                      |
|------------------|---------------------|--------------------------------------------------|
| :file_folder:    | Imagenes            | Carpeta que contiene im�genes del script en ejecuci�n |
| :page_facing_up: | BreachCompilation   |  |
| :page_facing_up: | breach-parse.sh     |  |
| :page_facing_up: | LICENSE             | Archivo de licencia MIT para el proyecto         |
| :book:           | README.md           | Archivo README con la documentaci�n del proyecto |
| :package:        | install.sh          | Script de instalaci�n automatizada               |

## :email: Contacto 
* :busts_in_silhouette: **Heath Adams**: [GitHub](https://github.com/hmaverickadams/breach-pars) - Desarrollador breach-pars 
* :busts_in_silhouette: **Dzhoni**: [GitHub](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/Findips) - Actualizacion Breach-Parse v2  

? https://t.me/AAAAAEXQOSyIpN2JZ0ehUQ [  ???? ] ?
