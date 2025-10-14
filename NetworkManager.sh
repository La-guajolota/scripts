#!/bin/bash
# Script para configurar Ubuntu Server para usar NetworkManager y nmcli

echo "==> Instalando NetworkManager..."
sudo apt update
sudo apt install -y network-manager

echo "==> Configurando Netplan para usar NetworkManager..."
cat <<EOF | sudo tee /etc/netplan/01-network-manager-all.yaml
network:
  version: 2
  renderer: NetworkManager
EOF

echo "==> Aplicando configuración de Netplan..."
sudo netplan apply

echo "==> Reiniciando NetworkManager..."
sudo systemctl restart NetworkManager

echo "==> Listo. Ya puedes usar nmcli para gestionar tus interfaces (eth0, wlan0, etc)."
