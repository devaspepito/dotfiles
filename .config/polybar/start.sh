#!/bin/bash
# pkill polybar
# polybar -r i3 &

# Verifica si el monitor externo está conectado
if xrandr | grep "HDMI1 connected"; then
    # Si está conectado, ejecuta configuración para dos monitores
    pkill polybar
    polybar -r i3h &
    polybar -r i3r &
else
    # Si no está conectado, ejecuta configuración para un monitor
    pkill polybar
    polybar -r i3 &
fi
