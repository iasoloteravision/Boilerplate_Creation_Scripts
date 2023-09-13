#!/bin/bash

# Solicitar el nombre del archivo HTML
read -p "Ingrese el nombre del archivo HTML (sin la extensión .html): " file_name

# Agregar la extensión .html al nombre del archivo
file_name="$file_name.html"

# Crear el archivo HTML
echo "<!DOCTYPE html>
<html>
<head>
    <title>Mi Página</title>
</head>
<body>
    <h1>Hola, esta es mi página</h1>
    <p>Bienvenido a mi página HTML creada con un script Bash.</p>
</body>
</html>" > $file_name

echo "Archivo HTML '$file_name' creado con éxito."
