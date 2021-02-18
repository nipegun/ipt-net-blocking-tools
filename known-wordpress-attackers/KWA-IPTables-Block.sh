#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software
# de dominio público". Puedes hacer lo que te salga de los huevos con él
# porque es libre de verdad; no libre con condiciones como las licencias GNU
# y otras patrañas similares. Si se te llena la boca hablando de libertad
# entonces hazlo realmente libre. No tienes que aceptar ningún tipo de términos
# de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------
#  Script de NiPeGun para bloquear IPs Spam comprobadas
#--------------------------------------------------------

echo ""
echo "Creando un nuevo set para la lista de IPs Spam a banear..."
echo ""
ipset --flush IPsSpamComprobadas
ipset --create IPsSpamComprobadas iphash

echo ""
echo "Agregando las IPs de la lista /root/IPsSpamComprobadas.list al set..."
echo ""
cat /root/IPsSpamComprobadas.list | while read IP
  do
    ipset -q -A IPsSpamComprobadas $IP # -q silencia las advertencias para IPs previamente agregadas
  done

echo ""
echo "Agregando una regla input a IPTables con el set de IPs Spam a banear..."
echo ""
iptables -A INPUT -m set --match-set IPsSpamComprobadas src -j DROP

