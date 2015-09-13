#/bin/bash

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

echo -e "\t--- importation d'une bdd vide wordpress ---"
wp db import $path/vendor/sraleik/script_wordpress/bdd/base.sql --allow-root

echo -e "\t--- lancement de search-replace ---"
wp search-replace "://localhost/test" "://$local_sitename" --allow-root
