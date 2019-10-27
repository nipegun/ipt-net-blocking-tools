#!/bin/bash

apt-get -y install nftables

sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv6/VN.ipv6"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv4/VN.ipv4"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv6/UA.ipv6"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv4/UA.ipv4"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv6/RU.ipv6"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv4/RU.ipv4"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv6/CN.ipv6"' /etc/nftables.conf
sed -i '/^flush ruleset/a include "/root/scripts/non-spanish-country-blocker/geoipsets/nftset/ipv4/CN.ipv4"' /etc/nftables.conf
sed -i -e 's|flush ruleset|flush ruleset\n|g' /etc/nftables.conf

echo "table netdev filter {" >>                                               /etc/nftables.conf
echo "" >>                                                                    /etc/nftables.conf
echo "  set country-ipv4-blacklist {" >>                                      /etc/nftables.conf
echo "    type ipv4_addr" >>                                                  /etc/nftables.conf
echo "    flags interval" >>                                                  /etc/nftables.conf
echo "    elements = { \$CN.ipv4, \$RU.ipv4, \$UA.ipv4, \$VN.ipv4 }" >>       /etc/nftables.conf
echo "  }" >>                                                                 /etc/nftables.conf
echo "" >>                                                                    /etc/nftables.conf
echo "  set country-ipv6-blacklist {" >>                                      /etc/nftables.conf
echo "    type ipv6_addr" >>                                                  /etc/nftables.conf
echo "    flags interval" >>                                                  /etc/nftables.conf
echo "    elements = { \$CN.ipv6, \$RU.ipv6, \$UA.ipv6, \$VN.ipv6 }" >>       /etc/nftables.conf
echo "  }" >>                                                                 /etc/nftables.conf
echo "" >>                                                                    /etc/nftables.conf
echo "  chain ingress {" >>                                                   /etc/nftables.conf
echo "    type filter hook ingress device eth0 priority 0; policy accept;" >> /etc/nftables.conf
echo "    ip saddr @country-ipv4-blacklist counter drop" >>                   /etc/nftables.conf
echo "    ip6 saddr @country-ipv6-blacklist counter drop" >>                  /etc/nftables.conf
echo "  }" >>                                                                 /etc/nftables.conf
echo "" >>                                                                    /etc/nftables.conf
echo "}" >>                                                                   /etc/nftables.conf

