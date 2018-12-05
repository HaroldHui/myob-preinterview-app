#!/usr/bin/env bash

set -e
cd $(dirname $0)/..

echo 'Running static Code analysis'
docker-compose run myob-api rubocop