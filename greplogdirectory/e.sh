#!/bin/sh

#sh ./createdirandfiles.sh

#get dir
#using pcregrep
#logDir=$(echo $f |pcregrep -o1 -i '^.+(/var/log.[^:]+/web):.+$' docker-compose.yml)

#using grep
logDirs=$(grep -Po '^.+\K(/var/log/.[^:]+/web):.+$' docker-compose.yml | cut -d: -f1)
echo $logDirs
if [ -z $logDirs ]; then
	echo '### No log directory found in compose or check regex expression in grep'
else
	for logDir in $logDirs; do
    	echo "### Log directory found in compose file - $logDir"
    	echo "### Following files would be cleared "    	
    	echo $(ls $logDir)
    	sudo rm -rf $logDir/*
    	if [ "`echo $logDir/*`" -eq "$logDir/*" ]; then
			echo '### All log file successully cleared '$logDir
		fi
	done	
fi


