#!/bin/bash

linea='export HISTTIMEFORMAT="%F %T "'

echo "🔄 Aplicando configuración a todos los usuarios existentes..."

for dir in /home/*; do
    if [ -d "$dir" ]; then
        archivo="$dir/.bashrc"
        if [ -f "$archivo" ]; then
            if grep -Fxq "$linea" "$archivo"; then
                echo "✔ Ya estaba configurado para $(basename "$dir")"
            else
                echo "$linea" >> "$archivo"
                echo "✅ Configurado para $(basename "$dir")"
            fi
        fi
    fi
done

echo "🏁 Listo. Cada usuario deberá ejecutar 'source ~/.bashrc' o reiniciar su terminal para aplicar los cambios."

