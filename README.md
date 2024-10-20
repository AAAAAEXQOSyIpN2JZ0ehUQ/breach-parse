![logo](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse/blob/master/Imagenes/breach-parse.png)

# Breach Parse :octocat:

## :information_source: Descripción
Breach-Parse: Herramienta de Parsing de Dominios Comprometidos

Este es un script de Bash diseñado para extraer credenciales de archivos filtrados en grandes colecciones de bases de datos de breaches. Automatiza el proceso de búsqueda de dominios específicos dentro de la Breach Compilation.

## :computer: Instalación
```bash
cd /opt
sudo rm -rf breach-parse
sudo git clone https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse.git
sudo chmod +x breach-parse/*
cd breach-parse
sudo ./install.sh
ls -ltha
```

Descarga la lista de contraseñas filtradas desde magnet, que se encuentra aquí:

`magnet:?xt=urn:btih:7ffbcd8cee06aba2ce6561688cf68ce2addca0a3&dn=BreachCompilation&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fglotorrents.pw%3A6969&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337`

Si no almacena la lista de contraseñas (BreachCompilation) en `/opt/breach-parse`, especifique la ubicación de la siguiente manera:

`breach-parse @gmail.com gmail.txt "~/Downloads/BreachCompilation/data"`

Ejecute `breach-parse` para obtener instrucciones
## :rocket: Modo de Uso

🔍 Ejemplos de Búsquedas

:memo:Para un mejor manejo de las búsquedas, por favor, colócate en la siguiente ruta: /opt/breach-parse

🗂️ Búsqueda en un dominio específico con archivo de salida personalizado:
```bash
./breach-parse.sh "@gmail.com" gmail.txt; grep -iE "hackerking4" output/gmail-master.txt
```

🗂️ Búsqueda en un dominio específico con archivo de salida personalizado (actualizado):
```bash
./breach-parse.sh "@gmail.com" gmail.txt; grep -iE "hackerking4|rashadmingrimes" output/gmail-master.txt
```

🗂️ Búsqueda en una lista de múltiples dominios:
```bash
./breach-parse.sh "@toyota.de|@live.cn" multiple.txt; cat multiple-master.txt | grep -i "rainer.luecke"
```

🗂️ Búsqueda en una lista de múltiples dominios (actualizado):
```bash
./breach-parse.sh "@toyota.de|@live.cn" multiple.txt; grep -iE "rainer.luecke|Harry2990" output/multiple-master.txt
```

📄 Búsqueda en un archivo existente:
```bash
cat example-master.txt | grep -i "hackerking4"
```

📄 Búsqueda en un archivo existente (actualizado):
```bash
cat example-master.txt | grep -iE "hackerking4|rashadmingrimes"
```

## :bookmark_tabs: Notas

- El script busca archivos en la ubicación de la Breach Compilation y extrae coincidencias de correos electrónicos y contraseñas para el dominio proporcionado.
- La salida incluye usuarios y contraseñas en archivos separados.
- Para evitar problemas con espacios en las rutas, asegúrate de usar comillas dobles donde sea necesario.

## :star2: Características 

- Colores e Iconos: El script muestra el progreso y resultados utilizando colores y símbolos para una mejor visualización.
- Barra de progreso: Durante el análisis, muestra el avance del procesamiento de los archivos.
- Extracción automática: Se generan archivos separados para usuarios y contraseñas extraídos.
- Prevención de duplicados: El script filtra automáticamente los duplicados para evitar resultados repetidos.

## :hammer_and_wrench: Requisitos 

- Sistema Operativo: Linux/Unix
- Dependencias: Bash, grep, awk

## :open_file_folder: Estructura del Repositorio

| Icono            | Nombre              | Descripción                                      |
|------------------|---------------------|--------------------------------------------------|
| :file_folder:    | Imagenes            | Carpeta que contiene imágenes del script en ejecución |
| :page_facing_up: | BreachCompilation   | Carpeta que contiene datos de brechas de seguridad. |
| :page_facing_up: | breach-parse.sh     | Script principal para analizar dominios comprometidos. |
| :page_facing_up: | LICENSE             | Archivo de licencia MIT para el proyecto         |
| :book:           | README.md           | Archivo README con la documentación del proyecto |
| :package:        | install.sh          | Script de instalación automatizada               |

## :star2: Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas para mejorar este script o encuentras algún problema, siéntete libre de abrir un *pull request* o *issue*.

## :warning: Advertencias

- Uso Responsable: Este script está diseñado para ser utilizado en dispositivos y redes que te pertenecen o para las que tienes permiso de uso. No lo utilices para actividades no autorizadas.

## :email: Contacto 
* :busts_in_silhouette: **hmaverickadams**: [GitHub](https://github.com/hmaverickadams/breach-parse) - Desarrollador breach-pars (Heath Adams) 
* :busts_in_silhouette: **Dzhoni**: [GitHub](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/breach-parse) - Actualizacion breach-parse.sh Apactacion codigo  

☆ https://t.me/AAAAAEXQOSyIpN2JZ0ehUQ [  ⃘⃤꙰✰ ] ☆
