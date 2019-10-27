# non-spanish-country-blocker

non-spanish-country-blocker pretende ser un repositorio con una lista de IPs de países de habla no hispana. Está pensado para, en el caso de ser necesario, bloquear con IPTables países que no tengan suficientes castellano-parlantes de forma que nuestro servidor sólo esté disponible para los países que entiendan el español.

Puedes aprender sobre la distribución geográfica del idioma español aquí:

https://es.wikipedia.org/wiki/Distribuci%C3%B3n_geogr%C3%A1fica_del_idioma_espa%C3%B1ol

## Instalación


```shell
apt-get -y update
apt-get -y install git ipset
rm /root/scripts/non-spanish-country-blocker -R
cd /root/scripts
git clone --depth=1 https://github.com/nipegun/non-spanish-country-blocker
rm /root/scripts/non-spanish-country-blocker/.git -R
rm /root/scripts/non-spanish-country-blocker/README.md
chmod +x /root/scripts/non-spanish-country-blocker/*.sh -R
```

## Países disponibles (por ahora)

cn = China

de = Alemania

ru = Rusia

ua = Ucrania

uk = Reino Unido

vn = Vietnam

