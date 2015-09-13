#/bin/bash

tmp=`pwd`


echo -e "\n*** IMPORT BDD\n"

prod_user=`cat $tmp/params.json | jq -r '.prod_user'`
prod_domain=`cat $tmp/params.json | jq -r '.prod_domain'`

prod_bdd_user=`cat $tmp/params.json | jq -r '.prod_bdd_user'`
prod_bdd_pass=`cat $tmp/params.json | jq -r '.prod_bdd_pass'`
prod_bdd_name=`cat $tmp/params.json | jq -r '.prod_bdd_name'`

#prod_sitename != prod_domain?  www.sraleik.fr != 192.168.1.18
prod_sitename=`cat $tmp/params.json | jq -r '.prod_sitename'`
local_sitename=`cat $tmp/params.json | jq -r '.local_sitename'`

prod_path_to_script=`cat $tmp/params.json | jq -r '.prod_path_to_script'`
prod_path_to_backup=`cat $tmp/params.json | jq -r '.prod_path_to_backup'`
prod_branch=`cat $tmp/params.json | jq -r '.prod_branch'`

echo -e "$prod_path_to_script/bdd_dump.sh"

date=`date +"%d-%m-%Y-%H:%M"`

filename="$prod_bdd_name"
filename+="_$prod_branch"
filename+="_$date"

echo "futur => $filename"

ssh $prod_user@$prod_domain "$prod_path_to_script/bdd_dump.sh $prod_bdd_user $prod_bdd_pass $prod_bdd_name $prod_path_to_backup $prod_branch"

sleep 1

scp $prod_user@$prod_domain:$prod_path_to_backup/$filename* /tmp/

filename=`ls /tmp/$filename*`
echo "ya quelqu'un? => $filename"

wp db import $filename --allow-root

echo -e "\n--- lancement de search-replace ---"
wp search-replace "://$prod_sitename" "://$local_sitename" --allow-root


