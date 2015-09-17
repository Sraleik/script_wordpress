#!/bin/bash

user=$1
mdp=$2
dbname=$3
host=$4
path=$5

echo -e "\n*** CONFIG.PHP ***"

if ! type "wp" &> /dev/null; then

  if ! type "curl" &> /dev/null; then
    echo -e "\t--- install de curl pour installer wp-cli"
    sudo apt-get install curl -yf
  fi

  echo -e "\t--- téléchargement de wp-cli ---"
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
else
  echo -e "\t--- wp-cli trouvé ---"
fi

if [ -f "$path/wp-config.php" ];then
  echo -e "\t--- suppression de wp-config ---"
  rm $path/wp-config.php
fi

echo -e "\t--- création de wp-config.php ---"
wp core config --dbname=$dbname --dbuser=$user --dbpass=$mdp --dbhost=$host --allow-root
