#!/bin/bash

cd ~/workspace/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
else
	echo "Formato não é valido"
fi

