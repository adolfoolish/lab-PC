#!/bin/sh 
 
ASUNTO=$1  
DESTINATARIO=$2  
CUERPO=$3  

SERVER_NAME=$HOSTNAME  
REMITENTE=$(whoami)  
USER="noreply"

[[ -z $1 ]] && ASUNTO="Notificacion de $REMITENTE en $SERVER_NAME"  
[[ -z $2 ]] && DESTINATARIO=" "   #aqui el usuario debe colocar un correo default
[[ -z $3 ]] && CUERPO="no hay contenido"  

MAIL_TXT="Asunto: $ASUNTO\nFrom: $REMITENTE\nTo: $DESTINATARIO\n\n$CUERPO"  
echo -e $MAIL_TXT | sendmail -t  
exit $?  