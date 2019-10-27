#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software
# de dominio público". Puedes hacer lo que te salga de los huevos con él
# porque es libre de verdad; no libre con condiciones como las licencias GNU
# y otras patrañas similares. Si se te llena la boca hablando de libertad
# entonces hazlo realmente libre. No tienes que aceptar ningún tipo de términos
# de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#---------------------------------------------------------------------------------
#  Script de NiPeGun para sincronizar el repositorio non-spanish-country-blocker
#---------------------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

# Comprobar si hay conexión a Internet antes de sincronizar el repositorio
wget -q --tries=10 --timeout=20 --spider https://github.com
  if [[ $? -eq 0 ]]; then
    echo ""
    echo "------------------------------------------------------------"
    echo -e "  ${ColorVerde}Sincronizando repositorio non-spanish-country-blocker...${FinColor}"
    echo "------------------------------------------------------------"
    echo ""
    rm /root/scripts/non-spanish-country-blocker -R
    cd /root
    git clone --depth=1 https://github.com/nipegun/non-spanish-country-blocker
    rm /root/scripts/non-spanish-country-blocker/.git -R
    rm /root/scripts/non-spanish-country-blocker/README.md
    chmod +x /root/scripts/non-spanish-country-blocker/*.sh -R
    echo ""
    echo "--------------------------------------------"
    echo -e "  ${ColorVerde}Repositorio sincronizado correctamente${FinColor}"
    echo "--------------------------------------------"
    echo ""
  else
    echo ""
    echo "---------------------------------------------------------------------------------------------------"
    echo -e "${ColorRojo}No se pudo iniciar la sincronización del repositorio porque no se detectó conexión a Internet.${FinColor}"
    echo "---------------------------------------------------------------------------------------------------"
    echo ""
fi

