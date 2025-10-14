#!/bin/bash

# Instala dependencias
sudo apt update
sudo apt install -y git cmake gcc \
  libglib2.0-dev libpci-dev libx11-dev \
  libxcb1-dev libxdmcp-dev

# Clona el repositorio
git clone https://github.com/fastfetch-cli/fastfetch.git
cd fastfetch

# Compila
mkdir build && cd build
cmake ..
make -j$(nproc)

# Instala
sudo make install

# Verifica instalación
echo "✅ Fastfetch instalado. Ejecutando:"
fastfetch
