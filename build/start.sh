#!/bin/sh
if [ ! -f /hath/data/data/client_login ]; then
	if [ $HatH_KEY ]; then
		echo -n "${HatH_KEY}" > /hath/data/data/client_login
	fi
fi

java -jar HentaiAtHome.jar $HatH_ARGS
