#/bin/bash
#
#Usage:
#typesearch.sh [-c dir] [-i] [-R|r] <pattern> <path>
# -c Copy files found to dir
# -i ignore case
# -R|-r Recursively search subdirectories
# <pattern> File type pattern to search for
# <path> Path to start search

DEEPORNOT="-maxdepth 1"

while getopts 'c:irR' opt
do
	case "${opt}" in
		c)
			COPY=YES
			DESTDIR="$OPTARG"
			;;
		i)
			CASEMATCH='-i'
			;;
		[Rr])
			unset DEEPORNOT
			;;
		*)
			exit 2
			;;
	esac
done

shift $((OPTIND - 1))

PATTERN=${1:-PDF document}
STARTDIR=${2:-.}

find $STARTDIR $DEEPORNOT -type f | while read FN
do
	file $FN | egrep -q $CASEMATCH "$PATTERN"
	if (( $? == 0 ))
	then
		echo $FN
		if [[ $COPY ]]
		then
			cp -p $FN $DESTDIR
		fi
	fi
done
