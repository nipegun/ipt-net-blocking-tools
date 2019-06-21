#!/bin/bash

IPAPITelegram=$(ping -c 1 api.telegram.org | awk -F'[()]' '/PING/{print $2}')
echo ""
echo "Permitiendo tráfica desde y hacia la API de Telegram ($IPAPITelegram)..."
echo ""
iptables -A INPUT -p tcp -s $IPAPITelegram -j ACCEPT
iptables -A OUTPUT -p tcp -d  $IPAPITelegram -j ACCEPT

