#!/bin/bash

VAR=0

echo 'There are '$#' argument(s)'
NUM=$#

for (( i=0; i < $NUM; i++))
do
	ARR[i]=$1
	shift
	echo ${ARR[$i]}
done
echo ${ARR[*]}

((NUM2=$NUM+1))
for (( z = 0; z < $NUM; z++))
do
	if (($z % 2 == 0))
	then
		echo $z
       		((VAR=$VAR+1))
		echo 'arg'$VAR ':' ${ARR[$z]}
	else
		continue
	fi
done

