#!/bin/bash

tmp=`pwd`


echo -e "\n*** IMPORT BDD\n"

#prod_sitename != prod_domain?  www.sraleik.fr != 192.168.1.18
prod_sitename=`cat $tmp/params.json | jq -r '.prod_sitename'`
local_sitename=`cat $tmp/params.json | jq -r '.local_sitename'`

# curl sing-sing-bis-exportbdd.sraleik.fr/recette

# sleep 1

# curl -o /tmp/singsingbis_recette_bdd.sql sing-sing-bis-exportbdd.sraleik.fr//singsingbis_recette_bdd.sql

# filename=/tmp/singsingbis_recette_bdd.sql

# echo "ya quelqu'un? => $filename"

# wp db import $filename --allow-root

# echo -e "\n--- lancement de search-replace ---"
# wp search-replace "://$prod_sitename" "://$local_sitename" --allow-root
