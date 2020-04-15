# ipt-net-blocking-tools

IPTables tools to block some internet traffic

## Installation

```shell
apt-get -y update > /dev/null
apt-get -y install git ipset > /dev/null
rm /root/scripts/ipt-net-blocking-tools -R
cd /root/scripts
git clone --depth=1 https://github.com/nipegun/ipt-net-blocking-tools
rm /root/scripts/ipt-net-blocking-tools/.git -R
rm /root/scripts/ipt-net-blocking-tools/README.md
find /root/scripts/ipt-net-blocking-tools/ -type f -iname "*.sh" -exec chmod +x {} \;
```
## Tools

### non-spanish-speaking countries

Puedes aprender sobre la distribución geográfica del idioma español aquí:

https://es.wikipedia.org/wiki/Distribuci%C3%B3n_geogr%C3%A1fica_del_idioma_espa%C3%B1ol
