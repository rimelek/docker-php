#!/usr/bin/env bash

VERSION=$1

shift 

ARGS=""
for ARG in "$@"; do
    ARGS="${ARGS} \"${ARG//\"/\\\"}\""
done;

VERSIONS="5.6/fpm 7.0/fpm 7.1/fpm 7.2/fpm"

mkdir -p build/${VERSION}

for V in ${VERSIONS}; do
    if [ "${V}" == "${VERSION}" ]; then
        if [ -d "build/${V}" ]; then
            rm -rf "build/${V}"
        fi;
        mkdir -p "build/${V}"
    fi;
done;

if [ "${VERSION}" != "" ] && [ -d build/${VERSION} ]; then
    cp -R common/* build/${VERSION}/
    cp -R ${VERSION}/* build/${VERSION}/
    cd build/${VERSION}/

    cp "Dockerfile.tpl" "Dockerfile"

    PHP_EXT_GROUP_ALL_PATH="args/PHP_EXT_GROUP_ALL"
    PECL_EXT_GROUP_ALL_PATH="args/PECL_EXT_GROUP_ALL"
    TAG_PATH="TAG"

    if [ ! -f "${PHP_EXT_GROUP_ALL_PATH}" ]; then
        >&2 echo "Missing required file: ${PWD}/${PHP_EXT_GROUP_ALL_PATH}";
        exit 1;
    fi;
    if [ ! -f "${PECL_EXT_GROUP_ALL_PATH}" ]; then
        >&2 echo "Missing required file: ${PWD}/${PECL_EXT_GROUP_ALL_PATH}";
        exit 1;
    fi;


    TAG=$(cat "${TAG_PATH}")
    sed -i "s/{{TAG}}/${TAG}/g" "Dockerfile"

    declare -A BUILD_ARGS;
    BUILD_ARGS=(
        [PHP_EXT_GROUP_ALL]="args/PHP_EXT_GROUP_ALL"
        [PECL_EXT_GROUP_ALL]="args/PECL_EXT_GROUP_ALL"
    );

    BUILD_ARGS_STR="";
    for ARG_NAME in ${!BUILD_ARGS[@]}; do
        ARG_VAL="\\\\\\n";
        for i in $(cat "${BUILD_ARGS[${ARG_NAME}]}"); do
            ARG_VAL="${ARG_VAL}${i} \\\\\\n";
        done;
        BUILD_ARGS_STR="${BUILD_ARGS_STR}\nARG ${ARG_NAME}=\"${ARG_VAL}\""
    done;

    sed -i "s/{{ARGS}}/${BUILD_ARGS_STR}/g" "Dockerfile"

    START_TIME=`date +%s`;
    CMD=$(which docker)" build ${ARGS} ."
    eval ${CMD}
    
    
    END_TIME=`date +%s`; 
    echo -n "Build time: "
    echo -n $(($END_TIME - $START_TIME));
    echo " sec"
fi;