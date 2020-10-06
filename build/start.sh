#!/bin/sh

kill_jar() {
  echo 'Received TERM'
  killall java
  wait "$(ps -ef | pgrep java)"
  echo 'Process finished'
}

if [ $HatH_KEY ]
	then
		echo -n "${HatH_KEY}" > /hath/data/data/client_login
	else
		if [ ! -f /hath/data/data/client_login ]; then
		echo "Login not found, try specify the HatH_KEY arg, exiting......"
		exit 1
		fi
fi

trap 'kill_jar' TERM INT KILL
java -jar HentaiAtHome.jar $HatH_ARGS  &

wait $!
