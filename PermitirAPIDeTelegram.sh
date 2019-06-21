#!/bin/bash

#IPAPITelegram=$(ping -c 1 api.telegram.org | awk -F'[()]' '/PING/{print $2}')
#echo ""
#echo "Permitiendo tráfico desde y hacia la API de Telegram ($IPAPITelegram)..."
#echo ""
#iptables -I INPUT -p tcp -s $IPAPITelegram -j ACCEPT
#iptables -I OUTPUT -p tcp -d  $IPAPITelegram -j ACCEPT

sed -i -e's|149.154.160.0/20|#149.154.160.0/20|g' /root/non-spanish-country-blocker/ru.txt

