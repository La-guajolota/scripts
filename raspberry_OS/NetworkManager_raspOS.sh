#!/bin/bash
# Script para configurar Raspberry Pi OS Lite para usar NetworkManager

echo "==> Instalando NetworkManager..."
sudo apt update
sudo apt install -y network-manager

echo "==> Deshabilitando y deteniendo dhcpcd (entra en conflicto con NetworkManager)..."
sudo systemctl disable --now dhcpcd

echo "==> Habilitando NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl restart NetworkManager

echo "==> Verificando estado de las interfaces..."
nmcli device status

echo "==> Listo. Ya puedes usar nmcli para conectar Wi-Fi, Ethernet, etc."
