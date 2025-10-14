#!/bin/bash

x=1

while read -r line; do
echo "Line $x $line"
(( x++ ))
done < hamlet

for cups in 1 2 3 4 5;
do
	echo "Hey, you've got $cups cups of coffee today!!"
done
