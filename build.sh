#!/usr/bin/env bash

if [ -z "${DOCKER_HUB_REPO}" ]; then
    >&2 echo "Variable not defined: DOCKER_HUB_REPO";
    exit 1;
fi;

if [ -n "${TRAVIS_BRANCH}" ]; then
    DOCKER_HUB_TAG=$(echo "${TRAVIS_BRANCH}" | cut -d'/' -f 2)-$(echo "${TRAVIS_BRANCH}" | cut -d'/' -f 3)
fi;

if [ -z "${DOCKER_HUB_TAG}" ]; then
    >&2 echo "Variable not defined: DOCKER_HUB_TAG";
    exit 1;
fi;

if [ -f "latest" ]; then
    docker build -t "${DOCKER_HUB_REPO}:${DOCKER_HUB_TAG}" -t "${DOCKER_HUB_REPO}:latest" .
else
    docker build -t "${DOCKER_HUB_REPO}:${DOCKER_HUB_TAG}" .
fi;