#!/bin/bash



ZIPFILE=${PROJECT_NAME}_amd64-linux.zip


BUILD_DIR=../build
PACKAGE_DIR=../package
DIST_DIR=../dist

rm -rf ${PACKAGE_DIR}
mkdir -p ${PACKAGE_DIR} ${DIST_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/${PROJECT_NAME} .

zip ${DIST_DIR}/${ZIPFILE} *
