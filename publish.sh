#!/usr/bin/env bash

set -x

name="openspeedtest"
docker_username="$(cat username)"
version="1.0.1"

docker login
docker buildx build -t "${docker_username}/${name}:${version}" --platform linux/amd64,linux/arm64,linux/arm/v7 --push .

set +x
