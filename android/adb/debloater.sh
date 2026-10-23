#!/usr/bin/env bash
set -euo pipefail

# Descripcion: Desinstala paquetes no deseados del usuario 0 en Android via ADB sin root.
# Uso: ./debloater.sh <nombre_paquete>

if [ "$#" -lt 1 ]; then
    echo "Uso: $0 <nombre_paquete>"
    echo "Ejemplo: $0 com.facebook.katana"
    exit 1
fi

PACKAGE="$1"

if ! command -v adb >/dev/null 2>&1; then
    echo "Error: adb no se encuentra en el PATH." >&2
    exit 1
fi

echo "Verificando dispositivo conectado..."
adb get-state >/dev/null 2>&1 || { echo "Error: No hay dispositivo Android conectado o autorizado."; exit 1; }

echo "Desinstalando $PACKAGE para el usuario 0..."
adb shell pm uninstall -k --user 0 "$PACKAGE"
echo "Operacion finalizada para $PACKAGE."
