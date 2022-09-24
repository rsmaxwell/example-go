#!/bin/bash

set -x

NAME=example-go
ZIPFILE=${NAME}_amd64-linux.zip

BUILD_DIR=./build
PACKAGE_DIR=./package
DIST_DIR=./dist

rm -rf ${PACKAGE_DIR} ${DIST_DIR}
mkdir -p ${PACKAGE_DIR} ${DIST_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/${NAME} .

zip ${DIST_DIR}/${ZIPFILE} *
