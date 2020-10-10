#!/bin/bash

funcion() {
    bandera=true
    contador=1
    while [ $bandera ]
    do
    echo $contador
    if [ $contador -eq 5 ];
    then
    break
    fi
    ((contador++))
    done
}
funcion
