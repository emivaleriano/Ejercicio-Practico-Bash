#!/bin/bash
DIRECTORIO="$HOME/EPNro1"
ENTRADA="$DIRECTORIO/entrada"
SALIDA="$DIRECTORIO/salida"
PROCESADO="$DIRECTORIO/procesado"

if [ "$1" == "-d" ]; then
    echo "Borrando todo el entorno..."
    rm -rf "$DIRECTORIO"
    pkill -f "consolidar.sh"
    echo "Listo, todo limpio."
    exit
fi

# EL MENÚ (Se repite hasta que elijas la opción 6)
opcion=0
while [ "$opcion" -ne 6 ]; do
    echo "--- MENÚ PRINCIPAL ---"
    echo "1. Crear carpetas"
    echo "2. Correr proceso en el fondo"
    echo "3. Listar por padrón"
    echo "4. Ver 10 notas más altas"
    echo "5. Buscar un alumno"
    echo "6. Salir"
    read -p "Elegí una opción: " opcion

    if [ "$opcion" -eq 1 ]; then
        mkdir -p "$ENTRADA" "$SALIDA" "$PROCESADO"
        echo "Carpetas creadas en $DIRECTORIO"

  # Copiamos el script de consolidar adentro de la carpeta y lo ejecutamos
    elif [ "$opcion" -eq 2 ]; then
        cp consolidar.sh "$DIRECTORIO/"
        bash "$DIRECTORIO/consolidar.sh" & 
        echo "El proceso está funcionando en forma invisible (background)."

    fi
    #prueba de git
done