#!/bin/bash

while [ true ]
do
	list=($(ps -eo pid,%cpu | awk '{print $0}'))

	i=0 
	fuf=50.0
	for I in "${list[@]}"
	do

		if [ $i -eq 0 ]
		then	
			pid=$I
			i=1
		elif [ $i -eq 1 ]
		then
			#perc=($I | cut -d '.' -f l)
			perc=$I
			i=0
			if [ `echo "$fuf" \< "$perc"` ]
			then
				echo $pid
				echo $perc
				kill -9 $pid
			fi	
		else
			echo "fu"
		fi
	done
done
