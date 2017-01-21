#!/bin/sh
LOGDIR='/var/log/shabs/web'

if [ -d "$LOGDIR" ]; then
	echo '### Directory exist '$LOGDIR
else
	echo '### Directory do not exist, creating one'
	sudo mkdir -p $LOGDIR
fi

if [ "`echo $LOGDIR/*`" != "$LOGDIR/*" ]; then
	echo '### Log files exist in '$LOGDIR
else
	echo '### Log files do not exist, creating one '
	sudo touch $LOGDIR/a.txt
	sudo touch $LOGDIR/b.log
	sudo touch $LOGDIR/f.conf
fi
