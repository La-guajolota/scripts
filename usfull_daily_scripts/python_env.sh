#!/bin/bash
# Script para crear un entorno virtual de Python en Ubuntu 24.04
# El usuario introduce nombre y ruta donde crear el entorno.

set -e  # Detener ejecución si ocurre un error

# Pedir la ruta donde crear el entorno (puede ser ruta absoluta o relativa)
read -p "Introduce la ruta donde crear el entorno virtual (ejemplo: /home/usuario/proyectos): " RUTA_ENTORNO

# Pedir el nombre del entorno
read -p "Introduce el nombre del entorno virtual: " NOMBRE_ENTORNO

# Verificar que no estén vacíos
if [ -z "$RUTA_ENTORNO" ] || [ -z "$NOMBRE_ENTORNO" ]; then
    echo "❌ Ruta o nombre no pueden estar vacíos. Saliendo..."
    exit 1
fi

# Crear directorio si no existe
mkdir -p "$RUTA_ENTORNO"

# Actualizar paquetes
sudo apt update

# Instalar python3-venv si no está instalado
sudo apt install -y python3 python3-venv python3-pip

# Crear entorno virtual en la ruta indicada
python3 -m venv "$RUTA_ENTORNO/$NOMBRE_ENTORNO"

# Activar entorno virtual automáticamente
source "$RUTA_ENTORNO/$NOMBRE_ENTORNO/bin/activate"

echo "✅ Entorno virtual '$NOMBRE_ENTORNO' creado y activado en la ruta '$RUTA_ENTORNO'."
echo "Para salir del entorno usa: deactivate"
