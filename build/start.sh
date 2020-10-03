#!/bin/sh

if [ $HatH_KEY ]
	then
		echo -n "${HatH_KEY}" > /hath/data/data/client_login
	else
		echo "No HatH_KEY arg, exiting......"
		exit 1
fi

java -jar HentaiAtHome.jar $HatH_ARGS
