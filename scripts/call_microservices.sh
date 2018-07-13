#!/bin/bash

HOST="localhost"

if [[ "$OSTYPE" == "darwin"* ]]; then
    HOST="host.docker.internal"
fi

TOTAL_TIME=0
for i in {1..6}
do
	curl -u bob:wrongpass http://$HOST:8080/movies-microservice
	curl -u bob:12345678 http://$HOST:8080/movies-microservice
	curl -u matt:12345678 http://$HOST:8080/movies-microservice
	curl -u julian:12345678 http://$HOST:8080/movies-microservice
	curl -u john:12345678 http://$HOST:8080/movies-microservice
	curl -u steve:12345678 http://$HOST:8080/movies-microservice
	curl -u robert:12345678 http://$HOST:8080/movies-microservice
	scripts/sign.sh --key business-partner-key --secret "secret" GET http://$HOST:8080/movies-microservice2
	scripts/sign.sh --key business-partner-key --secret "secret" GET http://$HOST:8080/movies-microservice3
	scripts/sign.sh --key business-partner-key --secret "wrong_secret" GET http://$HOST:8080/movies-microservice2
	scripts/sign.sh --key cinema-app --secret "secret" GET http://$HOST:8080/movies-microservice
	scripts/sign.sh --key business-partner-key --secret "secret" GET http://$HOST:8080/movies-microservice
	echo ""
	echo "Please wait, it will be done in $((60 - TOTAL_TIME)) seconds..."
	sleep 10s
	TOTAL_TIME=$((TOTAL_TIME + 10))
done
echo "Script done."
