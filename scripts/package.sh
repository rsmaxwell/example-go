#!/bin/bash

set -x

ZIPFILE=example-go_amd64_linux.zip

BUILD_DIR=./build
PACKAGE_DIR=./package
DIST_DIR=./dist

rm -rf ${PACKAGE_DIR} ${DIST_DIR}
mkdir -p ${PACKAGE_DIR} ${DIST_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/hello .

zip ${DIST_DIR}/${ZIPFILE} *
