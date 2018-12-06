#!/usr/bin/env bash

set -e

cd $(dirname $0)/..

echo '--- Docker clean up'
docker stop $(docker ps -aq) || true
docker rm $(docker ps -aq) || true
echo y | docker volume prune