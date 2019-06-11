#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software
# de dominio público". Puedes hacer lo que te salga de los huevos con él
# porque es libre de verdad; no libre con condiciones como las licencias GNU
# y otras patrañas similares. Si se te llena la boca hablando de libertad
# entonces hazlo realmente libre. No tienes que aceptar ningún tipo de términos
# de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------
#  Script de NiPeGun para bloquear un país con IPTables
#--------------------------------------------------------

CantArgsEsperados=1
ArgsInsuficientes=65

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

Archivo=./$1.txt

if [ $# -ne $CantArgsEsperados ]
  then
    echo ""
    echo "------------------------------------------------------------------------------"
    echo -e "${ColorRojo}Mal uso del script.${FinColor} El uso correcto sería:"
    echo ""
    echo -e "  $0 ${ColorVerde}[CódigoPaís]${FinColor}"
    echo ""
    echo "Ejemplo:"
    echo "  $0 de"
    echo "------------------------------------------------------------------------------"
    echo ""
    exit $ArgsInsuficientes
  else
    if [ -f "$Archivo" ]; then
      echo ""
      ipset create $1 hash:net
      while read line;
      do
        ipset add $1 $line;
      done < $Archivo
      iptables -I INPUT -m set --match-set $1 src -j DROP
      echo ""
    else 
      echo "$Archivo no existe"
    fi
fi

