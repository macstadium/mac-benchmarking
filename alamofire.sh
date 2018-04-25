#! /bin/bash

if [ ! -d  $HOME/results ]; then
	echo "Missing results/ directory in $HOME"
	exit 1
elif [ ! -d $HOME/results/alamofire ]; then
	echo "Missing results/alamofire directory in $HOME/results"
	exit 1
fi


instruments -w 'iPhone X (11.2)' > /dev/null && wait 10

for number in {1..20}
do
echo "\n"
echo "$number. build of Alamofire \n"

{ time xcodebuild -workspace $HOME/Alamofire/Alamofire.xcworkspace -scheme "Alamofire iOS" -destination 'OS=11.2,name=iPhone X' -configuration Debug ENABLE_TESTABILITY=YES clean build test; } 2>&1 | tee $HOME/results/alamofire/alamofire-$number.txt

echo "\n"
echo "\n"

done

exit 0

