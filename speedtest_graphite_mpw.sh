#!/bin/bash

GRAPHITE=swarm.mus.tiberiansun.us
GRAPHITE_PORT=2003

while :
do
	#Automatic to MPW
	res=$(/home/ubuntu/speedtest-cli/speedtest_cli.py --server 15748  --simple | awk -F' ' '{print $2}' | tr "\\n" ":" | sed 's/\(.*\):/\1/')
	DATE=`date +%s`
	PING_DATA=$(echo $res | awk -F':' '{print $1}')
	DL_DATA=$(echo $res | awk -F':' '{print $2}')
	UL_DATA=$(echo $res | awk -F':' '{print $3}')
	echo "speedtest.mpw.upl ${UL_DATA} ${DATE}" | nc $GRAPHITE $GRAPHITE_PORT
	echo "speedtest.mpw.dl ${DL_DATA} ${DATE}" | nc $GRAPHITE $GRAPHITE_PORT
	echo "speedtest.mpw.ms ${PING_DATA} ${DATE}" | nc $GRAPHITE $GRAPHITE_PORT
:
	sleep 250
done
