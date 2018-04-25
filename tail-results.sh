#! /bin/bash


for number in {1..20}
do

echo "Output for $1-$number.txt:"

tail -3 $HOME/results/$1/$1-$number.txt

echo "\n"

done

exit 0
