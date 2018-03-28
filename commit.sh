#!/usr/bin/env bash

SOURCE_VERSION=$1
TARGET_VERSION=${2:-"${SOURCE_VERSION}"}

shift
shift

ARGS=""
for ARG in "$@"; do
    ARGS="${ARGS} \"${ARG//\"/\\\"}\""
done;

BASE_PATH=$(cd "$(dirname "$0")" && pwd -P);

BRANCH_NAME="build/${TARGET_VERSION}"
BUILT_VERSION_PATH="${BASE_PATH}/build/${SOURCE_VERSION}"
PUBLISHED_VERSION_PATH="${BASE_PATH}/published/${BRANCH_NAME}"
GIT_DIR="${BASE_PATH}/.git"

if [ -d "${PUBLISHED_VERSION_PATH}" ]; then
    rm -rf "${PUBLISHED_VERSION_PATH}"
fi;

mkdir -p "${PUBLISHED_VERSION_PATH}"
cp -R "${GIT_DIR}" "${PUBLISHED_VERSION_PATH}"
cd "${PUBLISHED_VERSION_PATH}"

if [ `git branch --list "${BRANCH_NAME}"` ]; then
    git checkout "${BRANCH_NAME}"
    git rm -rf .
    git clean -fxd
else
    git checkout --orphan "${BRANCH_NAME}"
fi;

cp -R "${BUILT_VERSION_PATH}/." "${PUBLISHED_VERSION_PATH}"
mv "gitignore.tpl" ".gitignore"
mv "gitattributes.tpl" ".gitattributes"
git add .

CMD=$(which git)" commit ${ARGS} ."
eval ${CMD}
