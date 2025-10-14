#!/bin/bash

fav_word=$1
user=$(whoami)
date=$(date)
directory=$(pwd)
name="pepes"

echo "Tú quien ser?"
read ser

echo "Good morning $ser!!"
sleep 1
echo "You're lokking good today $ser!!!"
sleep 1
echo "You have the best beard I've ever seen $ser!!"
echo "ESta es la compu del $name"
echo "TU palabra favorita es $fav_word"
sleep 1
echo "TAs loggiado como $user"
echo "Hoy es $date"
echo "Y tas en está ruta $directory"
