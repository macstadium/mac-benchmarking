#! /bin/bash

if [ ! -d  $HOME/results ]; then
	echo "Missing results/ directory in $HOME"
	exit 1
elif [ ! -d $HOME/results/ruby ]; then
	echo "Missing results/ruby directory in $HOME/results"
	exit 1
fi

for number in {1..20}
do

echo "\n"
echo "$number. build of Ruby"
echo "\n"

{ time sudo ruby-install ruby 2.5.0; } 2>&1 | tee $HOME/results/ruby/ruby-$number.txt

echo "\n"
echo "\n"

rm -rf /opt/rubies/ruby-2.5.0

done

exit 0
