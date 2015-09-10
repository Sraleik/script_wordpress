#/bin/bash

user=$1
pass=$2
bddname=$3
path=$4
local_sitename=$5
prod_sitename=$6

echo -e "*** BDD ***"

echo -e "\n--- supression de la bdd existante ---"
wp db drop --yes --allow-root

echo -e "\n--- création de la bdd vide ---"
wp db create --allow-root

echo -e "\n--- importation d'un bdd vide wordpress ---"
wp db import $path/vendor/sraleik/script_wordpress/bdd/base.sql --allow-root

echo -e "\n--- lancement de search-replace ---"
wp search-replace "://$prod_sitename" "://localhost/$local_sitename" --allow-root
