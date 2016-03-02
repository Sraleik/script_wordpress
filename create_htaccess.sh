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
echo -e "RewriteBase /$local_name/" >> $path/.htaccess
echo -e "RewriteRule ^index\.php$ - [L]" >> $path/.htaccess
echo -e "RewriteCond %{REQUEST_FILENAME} !-d\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteRule wp-content/uploads/(.*) http://marsault.net/wp-content/uploads/\$1 [NC,L]" >> $path/.htaccess
echo -e "RewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /$local_name/index.php [L]\n</IfModule>" >> $path/.htaccess
