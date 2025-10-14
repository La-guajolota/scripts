#!/bin/bash

echo "Quién eres?"
read name
echo "Cuántos años tienes?"
read age
echo "Holass, $name, tons tienes $age"

echo "$PWD, $SHELL, $USER, $HOSTNAME"
echo "$juan"
sleep 1

getrich=$((( $RANDOM % 15 ) + $age ))
echo "$name, you'll get rich when you are $getrich" 
