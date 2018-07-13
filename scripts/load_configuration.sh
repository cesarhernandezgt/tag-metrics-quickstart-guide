#!/bin/bash
#set -x

cd "$(dirname "$0")"
source ./import.sh


HOST="localhost"

if [[ "$OSTYPE" == "darwin"* ]]; then
    HOST="host.docker.internal"
fi

# Account Policies
import http://${HOST}:8080/tag data/account-policies.json

# Accounts
import http://${HOST}:8080/tag data/account-business-partner.json
import http://${HOST}:8080/tag data/account-bob.json
import http://${HOST}:8080/tag data/account-bob-mobile-client.json
import http://${HOST}:8080/tag data/account-matt.json
import http://${HOST}:8080/tag data/account-julian.json
import http://${HOST}:8080/tag data/account-john.json
import http://${HOST}:8080/tag data/account-steve.json


#Routes
import http://${HOST}:8080/tag data/movies_route.json
import http://${HOST}:8080/tag data/movies2_route.json


echo "This script added 7 accounts, 2 routes and it changed the account policies configuration. These are all required for this guide."
