#!/bin/bash

parametro=$1

while true; 
do
    echo "-----MENU-----"
    echo "1) Crear entorno"
    echo "2) Correr procesor"
    echo "3) Ver listado de alumnos ordenados por padrón"
    echo "4) Ver 10 notas más altas del listado de alumnos"
    echo "5) Ver datos del alumno con padrón: "
    echo "6) Salir"

    echo -n "Ingrese la opción del menú: "
    read opcion

    case $opcion in 
        1)
           mkdir -p ~/EPNro1/{entrada, salida, procesado}
           echo "Se creó el entorno en ~/EPNro1"
	   ;;

        2)
	   if [ ! -d ~/EPNro1 ]; then
		echo "Para realizar esta opción primero debe seleccionar la opción 1"
	   else
		echo "Corriendo proceso"
		nohup ~/EPNro1/consolidar.sh &
	   fi 
      ;;

        3) --

        4)

        5)

        6)
	   echo "Saliendo..."
           exit 0;;

    esac
done
