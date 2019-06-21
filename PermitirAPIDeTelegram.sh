#!/bin/bash

IPAPITelegram=$(ping -c 1 api.telegram.org | awk -F'[()]' '/PING/{print $2}')
echo $IPAPITelegram

iptables -A INPUT -p tcp -s $IPAPITelegram -j ACCEPT
iptables -A OUTPUT -p tcp -d  $IPAPITelegram -j ACCEPT

