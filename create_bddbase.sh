#!/bin/bash

user=$1
pass=$2
bddname=$3
path=$4
local_sitename=$5
prod_sitename=$6

echo -e "*** BDD ***"

echo -e "\t--- supression de la bdd existante ---"
wp db drop --yes --allow-root

echo -e "\t--- création de la bdd vide ---"
wp db create --allow-root

if ! type "gzip" &> /dev/null; then
  echo -e "\t--- install de gzip pour dezip la bdd"
  sudo apt-get install gzip -yf
fi

echo -e "\t--- dezip de la bdd de base ---"
cd $path/vendor/sraleik/script_wordpress/bdd/
gzip -d bdd_17_02_2016.gz

cd $path

echo -e "\t--- importation d'une bdd vide wordpress ---"
wp db import $path/vendor/sraleik/script_wordpress/bdd/bdd_17_02_2016 --allow-root

rm -f $path/vendor/sraleik/script_wordpress/bdd/bdd_17_02_2016

echo -e "\t--- lancement de search-replace ---"
wp search-replace "://marsault.net" "://$local_sitename" --allow-root
