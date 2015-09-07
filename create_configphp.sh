#/bin/bash

user=$1
mdp=$2
dbname=$3
host=$4
path=$5

echo -e "\n*** CONFIG.PHP ***"

echo -e "\n--- install de curl pour installer wp-cli"
sudo apt-get install curl -yf

echo -e "\n--- téléchargement de wp-cli ---"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

echo -e "\n--- suppression de wp-config (si existe) ---"
rm $path/wp-config.php

echo -e "\n--- création de wp-config.php ---"
wp core config --dbname=$dbname --dbuser=$user --dbpass=$mdp --dbhost=$host --allow-root
