#!/bin/bash

x=1

while [[ $x -le 100 ]]
do
	read -p "Pushup $x: Press enter to continue"
	echo "Hey, I just did $x pushup"
	(( x ++ ))
done
