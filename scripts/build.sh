#!/usr/bin/env bash

set -e

DOCKER_IMAGE=${APP_NAME}:${COMMIT}

echo 'Builing image'
docker build --compress --force-rm --no-cache -t "${DOCKER_IMAGE}"