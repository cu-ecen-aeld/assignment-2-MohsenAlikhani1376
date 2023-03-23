#!/bin/sh
if [ "$#" -eq 2 ]
then
    if [ -d "$1" ]
    then
#    	echo "$1 Is a Directory"
	filesdir="$1"
	searchstr="$2"
	matchfile=$(find "$filesdir" -type f -not -path '*/\.git/*' -exec grep -l "$searchstr" {} + | wc -l);
	matchlines=$(find "$filesdir" -type f -not -path '*/\.git/*' -exec grep  "$searchstr" {} + | wc -l);


	echo " The number of files are $matchfile and the number of matching lines are $matchlines "
#	echo "$filesdir Is a Directory"
    else
    	echo "It's not a directory ....."
    	exit 1
   	fi
else
    echo "Please insert input argument currectly"
    exit 1
fi
