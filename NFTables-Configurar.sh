#!/bin/bash

apt-get -y install nftables

cp /etc/nftables.conf /etc/nftables.conf.bak

sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/NFTables.reglas"' /etc/nftables.conf

sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

