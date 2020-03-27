#!/bin/bash
HASH=$1
DIR=${2:-.}
QUIT=${3}

function mkabspath () 
{
	if [[ $1 == /* ]]
	then
		ABS=$1
	else
		ABS="$PWD/$1"
	fi
}

find $DIR -type f |
while read fn
do
	THISONE=$(sha1sum "$fn")
	THISONE=${THISONE%% *}
	if [[ $QUIT ]]
	then
		if [[ $THISONE == $HASH ]]
		then
			mkabspath "$fn"
			echo $ABS
			break
		fi
	else
		mkabspath "$fn"
		echo $ABS
	fi
done
