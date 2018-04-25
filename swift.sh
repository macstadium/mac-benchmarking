#! /bin/bash

if [ ! -d  $HOME/results ]; then
	echo "Missing results/ directory in $HOME"
	exit 1
elif [ ! -d $HOME/results/swift ]; then
	echo "Missing results/swift directory in $HOME/results"
	exit 1
fi

cd $HOME/swift-source

for number in {1..20}
do

echo "\n"
echo "$number. build of Swift"

{ time ./swift/utils/build-script --release-debuginfo;} 2>&1 | tee $HOME/results/swift/swift-$number.txt

echo "\n"
echo "\n"

rm -rf $HOME/swift-source/build

done

exit 0 
