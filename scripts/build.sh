#!/bin/bash

set -x 

BUILD_DIR=./build

go build -o ${BUILD_DIR}/ ./...

ls -al ${BUILD_DIR}
