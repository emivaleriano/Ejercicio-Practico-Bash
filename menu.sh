#!/bin/bash

#rutas
DIRECTORIO="$HOME/EPNro1"
ENTRADA="$DIRECTORIO/entrada"
SALIDA="$DIRECTORIO/salida"
PROCESADO="$DIRECTORIO/procesado"

if [ "$1" == "-d" ]; then
    rm -rf "$DIRECTORIO"
    pkill -f "consolidar.sh"
    exit 0
fi

opcion=0
while [ "$opcion" -ne 6 ]; do
    echo "--- MENÚ PRINCIPAL ---"
    echo "1) Crear carpetas"
    echo "2) Correr proceso en el fondo"
    echo "3) Listar por padrón"
    echo "4) Ver 10 notas más altas"
    echo "5) Buscar un alumno"
    echo "6) Salir"
    read -p "Elegí una opcion: " opcion

    case $opcion in
        1)
            mkdir -p "$DIRECTORIO"/{entrada,salida,procesado}
            echo "Se creo el entorno en $DIRECTORIO"
            ;;
        2)
            if [ ! -d "$DIRECTORIO" ]; then
                echo "Primero debe seleccionar la op1"
            else
                echo "Corriendo proceso en background"
                nohup bash "$DIRECTORIO/consolidar.sh" > /dev/null 2>&1 &
            fi 
            ;;

        3)
            if [ -f "$DIRECTORIO/salida/$FILENAME.txt" ]; then
                echo "--- Listado por Padron ---"
                sort -n "$DIRECTORIO/salida/$FILENAME.txt"
            else
                echo "Debe correr la opcion 2"
            fi
            ;;

        4)
            if [ -f "$DIRECTORIO/salida/$FILENAME.txt" ]; then
                echo "--- Top 10 ---"
                sort -k4 -nr "$DIRECTORIO/salida/$FILENAME.txt" | head -n 10
            else
                echo "No hay datos procesados para mostrar el ranking"
            fi
            ;;

        5)
            if [ -f "$DIRECTORIO/salida/$FILENAME.txt" ]; then
                echo -n "Ingrese el padron que desea buscar: "
                read padron
                grep "^$padron " "$DIRECTORIO/salida/$FILENAME.txt" || echo "Padron no encontrado."
            else
                echo "No se puede buscar si el archivo de salida no existe."
            fi
            ;;

        6)
            echo "Saliendo"
            exit 0
            ;;

        *)
            echo "Opción invalida,ingrese nuevamente"
            ;;
    esac
done