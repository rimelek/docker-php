#!/usr/bin/env bash

SOURCE_VERSION=""
TARGET_VERSION=""
REMOTE_NAME=""

while getopts ":s:t:r:" opt ; do
    case ${opt} in
        s)
            SOURCE_VERSION="${OPTARG}";
            ;;
        t)
            TARGET_VERSION="${OPTARG}";
            ;;
        r)
            REMOTE_NAME="${OPTARG}";
            ;;
        \?)
            echo "Invalid option: -${OPTARG}"
            ;;
    esac;
done;

shift $((OPTIND-1))

if [ -z "${SOURCE_VERSION}" ]; then
    >&2 echo "-s is required";
    exit 1;
fi;

if [ -z "${TARGET_VERSION}" ]; then
    TARGET_VERSION="${SOURCE_VERSION}"
fi;
if [ -z "${REMOTE_NAME}" ]; then
    REMOTE_NAME="origin"
fi;

ARGS=""
for ARG in "$@"; do
    ARGS="${ARGS} \"${ARG//\"/\\\"}\""
done;

echo "${ARGS}"

BASE_PATH=$(cd "$(dirname "$0")" && pwd -P);

BRANCH_NAME="build/${TARGET_VERSION}"
SOURCE_VERSION_PATH="${BASE_PATH}/build/${SOURCE_VERSION}"
TARGET_VERSION_PATH="${BASE_PATH}/published/${BRANCH_NAME}"
GIT_DIR="${BASE_PATH}/.git"

if [ -d "${TARGET_VERSION_PATH}" ]; then
    rm -rf "${TARGET_VERSION_PATH}"
fi;

mkdir -p "${TARGET_VERSION_PATH}"
cp -R "${GIT_DIR}" "${TARGET_VERSION_PATH}"
cd "${TARGET_VERSION_PATH}"

git fetch "${REMOTE_NAME}"
if [ `git branch --list --remote "${REMOTE_NAME}/${BRANCH_NAME}"` ]; then
    git checkout "${REMOTE_NAME}/${BRANCH_NAME}" -b "${BRANCH_NAME}"
else
    git checkout --orphan "${BRANCH_NAME}"
fi;

git rm -rf .
git clean -fxd

cp -R "${SOURCE_VERSION_PATH}/." "${TARGET_VERSION_PATH}"
mv "gitignore.tpl" ".gitignore"
mv "gitattributes.tpl" ".gitattributes"
git add .

CMD=$(which git)" commit ${ARGS}"
eval ${CMD}
# git -C "${GIT_DIR}" fetch "${TARGET_VERSION_PATH}" "${BRANCH_NAME}:${BRANCH_NAME}"