#!/bin/bash

# Solicitar el nombre del proyecto Scrapy
read -p "Ingrese el nombre del proyecto Scrapy: " project_name

# Crear el directorio del proyecto
mkdir $project_name
cd $project_name

# Crear entorno virtual
python3 -m venv venv
source venv/bin/activate

# Instalar Scrapy
pip install scrapy

# Crear un nuevo proyecto Scrapy
scrapy startproject $project_name

# Navegar al directorio del proyecto Scrapy
cd $project_name

# Crear un spider
read -p "Ingrese el nombre del spider: " spider_name
scrapy genspider $spider_name example.com

# Mostrar instrucciones finales
echo "Proyecto Scrapy '$project_name' creado exitosamente."
echo "Entorno virtual activado. Para desactivar, ejecuta: deactivate"
echo "Puedes editar y personalizar el spider en el archivo '$spider_name.py' dentro de la carpeta 'spiders'."
