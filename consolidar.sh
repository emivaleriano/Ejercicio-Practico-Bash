#!/bin/bash

ENTRADA="$HOME/EPNro1/entrada"
SALIDA="$HOME/EPNro1/salida"
PROCESADO="$HOME/EPNro1/procesado"

while true; do
    for archivo in "$ENTRADA"/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "$SALIDA/$FILENAME.txt"
            mv "$archivo" "$PROCESADO/"
        fi
    done
done
