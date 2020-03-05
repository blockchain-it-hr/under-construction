#!/bin/bash
set -e

export TAG="$CIRCLE_BRANCH"

if [ "$CIRCLE_BRANCH" == "master" ]; then
    export TAG="stable";
    echo $TAG
fi

docker login --username $DOCKER_USER --password $DOCKER_PASS
docker-compose -f docker-compose.yaml build --no-cache --parallel
docker-compose -f docker-compose.yaml push