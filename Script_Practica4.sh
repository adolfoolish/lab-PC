#!/bin/bash

echo "Primero se imprimira el archivo msg.txt codificado en base64, el resto de los archivos generaran ya sea un .txt o una imagen .jpg en la  segun sea el caso"

base64 msg.txt 
base64 fcfm.png > fcfm.txt
base64 -d mystery_img1.txt > mystery_img1.jpg
base64 -d mystery_img2.txt > mystery_img2.jpg
