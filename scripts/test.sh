#!/usr/bin/env bash

set -e

cd $(dirname $0)/..

echo '--- Running code test'
docker-compose run myob-pre-interview rspec