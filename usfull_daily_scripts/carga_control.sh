#!/bin/zsh

# Verifica si se proporcionó un argumento
if [[ -z "$1" ]]; then
  echo "Uso: $0 <valor_de_umbral_entre_1_y_100>"
  exit 1
fi

# Valida que el valor sea un número entre 1 y 100
if ! [[ "$1" =~ '^[0-9]+$' ]] || (( $1 < 1 || $1 > 100 )); then
  echo "Error: el valor debe ser un número entre 1 y 100."
  exit 1
fi

# Ejecuta el comando con privilegios de superusuario
echo $1 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold

# Verifica si el cambio fue exitoso
if [[ $? -eq 0 ]]; then
  echo "✅ Umbral de carga establecido a $1%"
else
  echo "❌ Error al establecer el umbral. ¿Tienes permisos sudo?"
  exit 1
fi

# Muestra el porcentaje actual de carga
if [[ -f /sys/class/power_supply/BAT0/capacity ]]; then
  current_charge=$(cat /sys/class/power_supply/BAT0/capacity)
  echo "🔋 Porcentaje actual de carga: $current_charge%"
else
  echo "⚠️ No se pudo leer el porcentaje de carga de la batería."
fi
