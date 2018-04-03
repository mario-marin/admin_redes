#!/bin/bash

list=($(ps -eo pid,comm,%cpu | awk '{print $0}'))

i=0 
requerimiento=95.0
for I in "${list[@]}"
do

	if [ $i -eq 0 ]
	then	
		pid=$I
		i=1
	elif [ $i -eq 1 ]
	then
		i=2
		name=$I	
	elif [ $i -eq 2 ]
	then
		perc=$I
		i=0
		if [ `echo "$requerimiento" \< "$perc"` ]
		then
			echo "pid:$pid %cpu:$perc name:$name " >> killedProcess.log
			kill -9 $pid
		fi	
	else
		echo "error"
	fi
done
