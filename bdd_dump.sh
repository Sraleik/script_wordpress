#!/bin/bash

tmp=`pwd`


echo -e "\n*** BDD DUMP ***"

bddUser=$1
bddPass=$2
bddName=$3
path_to_backup=$4
branch=$5

date=`date +"%d-%m-%Y-%T"`

filename=${bddName}_${branch}_$date.sql

echo "creating =>  $filename"

mysqldump -u$bddUser -p$bddPass $bddName > $path_to_backup/$filename
