#!/bin/sh

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
PACKAGE_DIR=${PROJECT_DIR}/package
DIST_DIR=${PROJECT_DIR}/dist

. ${BUILD_DIR}/buildinfo

rm -rf ${PACKAGE_DIR} ${DIST_DIR}
mkdir -p ${PACKAGE_DIR} ${DIST_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/hello .

zip ${DIST_DIR}/${ZIPFILE} *
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "packaging failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

echo "Success"
