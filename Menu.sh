#!/bin/bash

FILENAME="FILENAME"
export FILENAME
continuar="si"
while [ "$continuar" == "si" ]; do
	echo "----- M E N U -----"
	echo "1. Crear Entorno"
	echo "2. Correr Proceso"
	echo "3. Mostrar Alumnos"
	echo "4. Mostrar Notas"
	echo "5. Mis Datos"
	echo "6. Salir"
	read -p "Elegi: " opcion
	case $opcion in
		1)
		mkdir -p EPNro1/entrada EPNro1/salida EPNro1/procesado
		mv alumnos_testeo.txt EPNro1/entrada/
		echo "Entorno Creado"
		;;
		2)
		cp consolidar.sh EPNro1/
		bash EPNro1/consolidar.sh &
		echo "Datos Procesados"
		;;
		3)
		if [ -f "EPNro1/salida/$FILENAME.txt" ]; then
			awk '{print $1,$2,$3,$4,$5}' EPNro1/salida/$FILENAME.txt | sort -n
		fi
		;;
		4)
		if [ -f "EPNro1/salida/$FILENAME.txt" ]; then
			awk '{print $5,$1,$2,$3,$4}' EPNro1/salida/$FILENAME.txt | sort -n -r | head -n 10
		fi
		;;
		5)
		if [ -f "EPNro1/salida/$FILENAME.txt" ]; then
			read -p "ingrese un nro de padron: " padron
			awk -v p="$padron" '$1 == p {print $0}' "EPNro1/salida/$FILENAME.txt"
		fi
		;;
		6)
        	echo "HASTA LA PROXIMA"
        	continuar="no"
       		;;
		*)
		echo "OPCION NO VALIDA"
		;;
	esac
done


