#!/bin/bash

#Startup delay
sleep 125

while :
do
	#Specific to CenturyLink Davenport
#	res2=$(/home/ubuntu/speedtest-cli/speedtest_cli.py --simple --server 10145 | awk -F' ' '{print $2}' | tr "\\n" ":" | sed 's/\(.*\):/\1/')
	#Specific for Metronet Davenport
	res2=$(/home/ubuntu/speedtest-cli/speedtest_cli.py --simple --server 28135 | awk -F' ' '{print $2}' | tr "\\n" ":" | sed 's/\(.*\):/\1/')
	rrdtool updatev /home/ubuntu/speedtest-cli/rrd_dvn/speedtest.rrd "N:${res2}"
	sleep 225
done
