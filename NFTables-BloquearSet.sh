#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software
# de dominio público". Puedes hacer lo que te salga de los huevos con él
# porque es libre de verdad; no libre con condiciones como las licencias GNU
# y otras patrañas similares. Si se te llena la boca hablando de libertad
# entonces hazlo realmente libre. No tienes que aceptar ningún tipo de términos
# de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------
#  Script de NiPeGun para bloquear un país con NFTables
#--------------------------------------------------------

CantArgsEsperados=1
ArgsInsuficientes=65

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

Archivo=/root/scripts/non-spanish-country-blocker/$1.txt

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
    echo ""
    echo -e "${ColorVerde}Bloqueando el país $1...${FinColor}"
    echo ""
    if [ -f "$Archivo" ]; then
      ipset -q x $1
      ipset -q --flush $1
      ipset create $1 hash:net
      while read line;
      do
        ipset -q add $1 $line;
      done < $Archivo
      xxx
      echo ""
      echo "País bloqueado!"
      echo ""
    else
      echo ""
      echo -e "${ColorRojo}El archivo $Archivo no existe. Prueba con otro.${FinColor}"
      echo ""
    fi
fi
