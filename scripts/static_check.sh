#!/usr/bin/env bash

set -e

echo $DOCKER_LOGIN_USER
echo $DOCKER_LOGIN_PASSWORD

cd $(dirname $0)/..

echo '--- Running static Code analysis'
docker-compose run myob-pre-interview rubocop