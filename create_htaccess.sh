#!/bin/bash
path=$1
local_name=$2
prod_name=$3


echo -e "*** HTACCESS ***"

if [ -f "$path/.htaccess" ];then
  echo -e "\t--- supression du .htaccess ---"
  rm $path/.htaccess
fi

echo -e "\t--- création du .htaccess ---"

echo -e "<IfModule mod_rewrite.c>\nRewriteEngine On" > $path/.htaccess
echo -e "RewriteBase /" >> $path/.htaccess
echo -e "RewriteRule ^index\.php$ - [L]" >> $path/.htaccess
echo -e "RewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /index.php [L]\n</IfModule>" >> $path/.htaccess
