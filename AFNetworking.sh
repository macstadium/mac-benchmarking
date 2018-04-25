#! /bin/bash

if [ ! -d  $HOME/results ]; then
	echo "Missing results/ directory in $HOME"
	exit 1
elif [ ! -d $HOME/results/afnetworking ]; then
	echo "Missing results/afnetworking directory in $HOME/results"
	exit 1
fi

for number in {1..20}
do

echo "\n"
echo "$number. build of AFNetworking"

{ set -o pipefail && time env NSUnbufferedIO=YES xcodebuild -workspace $HOME/AFNetworking/AFNetworking.xcworkspace -scheme AFNetworking\ iOS -configuration Debug -sdk 'iphonesimulator11.2' -destination 'name=iPhone X,OS=11.2' clean build test; } 2>&1 | tee $HOME/results/AFNetworking/afnetworking-$number.txt

echo "\n"
echo "\n"

done

exit 0 
