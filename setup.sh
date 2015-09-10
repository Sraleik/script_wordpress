#/bin/bash

tmp=`pwd`


echo -e "\n--- install de jq pour traiter le fichier params.json\n"
sudo apt-get install jq -yf



path=`cat $tmp/params.json | jq -r '.path'`
bdd_user=`cat $tmp/params.json | jq -r '.bdd_user'`
bdd_pass=`cat $tmp/params.json | jq -r '.bdd_pass'`
bdd_name=`cat $tmp/params.json | jq -r '.bdd_name'`
host=`cat $tmp/params.json | jq -r '.host'`
local_sitename=`cat $tmp/params.json | jq -r '.local_sitename'`
prod_sitename=`cat $tmp/params.json | jq -r '.prod_sitename'`

$path/vendor/sraleik/script_worpress/create_configphp.sh $bdd_user $bdd_pass $bdd_name $host $path

$path/vendor/sraleik/script_wordpress/create_htaccess.sh $path $local_sitename $prod_sitename

$path/vendor/sraleik/script_wordpress/create_bddbase.sh $bdd_user $bdd_pass $bdd_name $path $local_sitename $prod_sitename


echo -e "\n--- activation du mod a2enmod ---"
sudo a2enmod rewrite

echo -e "\n--- apache restart --"
sudo service apache2 stop
sudo service apache2 start

