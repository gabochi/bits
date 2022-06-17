#!/bin/bash

declare -a pila

agregar(){
	(( p++ ))
	pila[${p}]=${1}
}

operar(){
	case ${1} in

		d ) (( p++  ))
            pila[${p}]="${pila[$(( p - 1 ))]}"
			;;

		x ) x="${pila[$p]}"; pila[${p}]="${pila[$(( p - 1 ))]}"; pila[$(( p - 1 ))]="$x"
			;;

		* ) operacion="(${pila[$(( p - 1 ))]}${1}${pila[$p]})" 
			(( p-- )) 
			pila[${p}]="${operacion}"
			;;
	
	esac
	
}

	for ((i=1;i<=$#;i++))
	do 
		[[ ${!i} =~ t|[0-9] ]] && agregar "${!i}" || operar "${!i}"
	done
	echo "${pila[${p}]}" 


