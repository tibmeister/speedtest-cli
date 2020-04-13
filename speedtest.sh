#!/bin/bash

while :
do
	#Automatic to MPW
	res=$(/home/ubuntu/speedtest-cli/speedtest_cli.py --simple | awk -F' ' '{print $2}' | tr "\\n" ":" | sed 's/\(.*\):/\1/')
	rrdtool updatev /home/ubuntu/speedtest-cli/rrd/speedtest.rrd "N:${res}" 
	sleep 250
done
