#!/usr/bin/env bash
#
# batt-charge.sh
# Establece el umbral de carga máxima de la batería.

set -e

# Verificar argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 <porcentaje_de_carga (0-100)>"
  exit 1
fi

PCT=$1

# Validar que sea un número entre 0 y 100
if ! [[ "$PCT" =~ ^[0-9]+$ ]] || [ "$PCT" -lt 0 ] || [ "$PCT" -gt 100 ]; then
  echo "Error: porcentaje inválido. Debe ser un entero entre 0 y 100."
  exit 2
fi

# Ruta sysfs de los thresholds

echo PCT
