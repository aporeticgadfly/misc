#!/bin/bash
#Desc: cross btwn tail and wevtutil cmds on Windows system. Refreshes logs as they appear.

WINLOG=${1:-"Application"}

LASTLOG=$(wevtutil qe "$WINLOG" //c:1 //rd:true //f:text)

while true
do
	CURRENTLOG=$(wevtutil qe "$WINLOG" //c:1 //rd:true //f:text)

	if [[ "$CURRENTLOG" != "$LASTLOG" ]]
	then
		echo "$CURRENTLOG"
		echo "---------------------------------"
		LASTLOGT="$CURRENTLOG"
	fi
done
