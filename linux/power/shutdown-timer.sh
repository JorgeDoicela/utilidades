#!/usr/bin/env bash
set -euo pipefail

echo "======================================================"
echo "           TEMPORIZADOR DE APAGADO - LINUX            "
echo "======================================================"
echo ""
echo "1. Programar apagado en minutos"
echo "2. Cancelar apagado activo"
echo "3. Salir"
echo ""
read -r -p "Seleccione una opcion (1-3): " opcion

case "$opcion" in
    1)
        read -r -p "Minutos hasta el apagado: " minutos
        if ! [[ "$minutos" =~ ^[0-9]+$ ]]; then
            echo "Error: Entrada no valida, debe ser un numero entero." >&2
            exit 1
        fi
        shutdown +"$minutos" "Apagado programado en $minutos minutos."
        echo "Apagado programado en $minutos minutos."
        ;;
    2)
        shutdown -c
        echo "Apagado programado cancelado."
        ;;
    3)
        exit 0
        ;;
    *)
        echo "Opcion no valida."
        exit 1
        ;;
esac
