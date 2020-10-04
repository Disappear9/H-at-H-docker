#!/bin/sh

trap 'killall java' INT TERM KILL
if [ $HatH_KEY ]
	then
		echo -n "${HatH_KEY}" > /hath/data/data/client_login
	else
		if [ ! -f /hath/data/data/client_login ]; then
		echo "Login not found, try specify the HatH_KEY arg, exiting......"
		exit 1
		fi
fi

java -jar HentaiAtHome.jar $HatH_ARGS
