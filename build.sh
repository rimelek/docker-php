#!/usr/bin/env bash

VERSION=$1

shift 

ARGS=""
for ARG in "$@"; do
    ARGS="${ARGS} \"${ARG//\"/\\\"}\""
done;

VERSIONS="5.6/fpm 7.0/fpm 7.1/fpm"

if [ -d build ]; then 
    rm -R build
fi;

mkdir build

for V in ${VERSIONS}; do
    mkdir -p build/${V};
done;

if [ "${VERSION}" != "" ] && [ -d build/${VERSION} ]; then
    cp -R common/* build/${VERSION}/
    cp -R ${VERSION}/* build/${VERSION}/
    cd build/${VERSION}/
    
    START_TIME=`date +%s`;
    CMD=$(which docker)" build ${ARGS} ."
    eval ${CMD}
    
    
    END_TIME=`date +%s`; 
    echo -n "Build time: "
    echo -n $(($END_TIME - $START_TIME));
    echo " sec"
fi;