#!/bin/bash

echo "You died"
echo "Do you like coffe? (y/n)"
read coffee

if [[ $coffee == "y" ]]; then
	echo "You're awsome"
else
	echo "Leave right now!!!"
fi

#First beast to be eliminated
beast=$(( $RANDOM % 10 ))
echo "Your first beast is approching. Choose a number (0/9)"
read tarnished

if [[ $tarnished == $beast || $tarnished == $coffee ]]; then
	echo "Beast VANQUISHED!! COngrats fellow tarnished"
elif [[ $beast < 3 ]]; then
	echo "You have another chance"
	read tarnished
	if [[ $tarnished == $beast ]]; then
		echo "You made it!!"
	fi
else
	echo "You died. The beast was $beast"
fi

