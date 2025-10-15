#!/bin/bash

# Colores
MAGENTA="\e[35m"
RESET_COLOR="\e[0m"

# Directorios
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
USER_ICON_DIR="$HOME/.face"

# Preguntar al usuario por el archivo de fondo de pantalla
echo -e "${MAGENTA}Selecciona una imagen para el fondo de pantalla (desde: $WALLPAPER_DIR):${RESET_COLOR}"
read -e -p "Ruta de imagen: " wallpaper_path

# Validar archivo
if [ -f "$wallpaper_path" ]; then
    echo -e "${MAGENTA}Estableciendo fondo de escritorio...${RESET_COLOR}"
    gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wallpaper_path"
else
    echo -e "${MAGENTA}⚠️ Imagen no encontrada. Saltando fondo de pantalla.${RESET_COLOR}"
fi

# Preguntar por la imagen de usuario
echo -e "${MAGENTA}Selecciona una imagen para tu foto de perfil (icono de usuario):${RESET_COLOR}"
read -e -p "Ruta de imagen: " user_image_path

# Validar y copiar imagen
if [ -f "$user_image_path" ]; then
    echo -e "${MAGENTA}Actualizando imagen de usuario...${RESET_COLOR}"
    cp "$user_image_path" "$HOME/.face"
else
    echo -e "${MAGENTA}⚠️ Imagen no encontrada. Saltando imagen de perfil.${RESET_COLOR}"
fi

echo -e "${MAGENTA}✅ ¡Imágenes actualizadas!${RESET_COLOR}"
