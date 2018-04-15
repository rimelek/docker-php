#!/usr/bin/env bash

BUILD_SOURCE=""
BUILD_SOURCE_REMOTE=""
BUILD_SOURCE_REMOTE_BRANCH=""

while getopts ":s:rb:" opt ; do
    case ${opt} in
        s)
            BUILD_SOURCE="${OPTARG}";
            ;;
        r)
            BUILD_SOURCE_REMOTE="y";
            ;;
        b)
            BUILD_SOURCE_REMOTE_BRANCH="${OPTARG}"
            ;;
        \?)
            >&2 echo "Invalid option: -${OPTARG}"
            exit 1;
            ;;
    esac;
done;

shift $((OPTIND-1))

ARGS=""
for ARG in "$@"; do
    ARGS="${ARGS} \"${ARG//\"/\\\"}\""
done;

if [ -n "${BUILD_SOURCE_REMOTE}" ] && [ -z "${BUILD_SOURCE_REMOTE_BRANCH}" ]; then
    >&2 echo "-b is required when -r is given";
    exit 1
fi;

if [ -z "${BUILD_SOURCE}" ]; then
    >&2 echo "-s is required";
    exit 1
fi;

if [ -n "${BUILD_SOURCE_REMOTE}" ]; then
    git clone "${BUILD_SOURCE}"
fi;

    START_TIME=`date +%s`;
    CMD=$(which docker)" build ${ARGS} ."
    eval ${CMD}


    END_TIME=`date +%s`;
    echo -n "Build time: "
    echo -n $(($END_TIME - $START_TIME));
    echo " sec"