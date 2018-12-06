#!/usr/bin/env bash

set -e

DOCKER_IMAGE=${DOCKER_USER}/${APP_NAME}:${COMMIT}
echo $DOCKER_IMAGE

echo '--- Builing image'
docker build --compress --force-rm --no-cache -t "${DOCKER_IMAGE}" -f Dockerfile.deployable .

echo "--- Push the docker image ${DOCKER_IMAGE}"
docker push "${DOCKER_IMAGE}"