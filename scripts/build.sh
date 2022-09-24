#!/bin/bash

BUILD_DIR=./build

set -x 

go build -o ${BUILD_DIR} ./...

echo "BUILD_DIR = ${BUILD_DIR}"
ls -al ${BUILD_DIR}
