#!/usr/bin/env bash

set -e

cd $(dirname $0)/..

echo "--- Build app image"
docker-compose build

echo '--- Running static Code analysis'
docker-compose run myob-pre-interview rubocop

echo '--- Running code test'
docker-compose run myob-pre-interview rspec