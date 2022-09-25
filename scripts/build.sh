#!/bin/bash

set -x 

pwd

echo "GOROOT = $(go env GOROOT)"
echo "GOPATH = $(go env GOPATH)"

echo "Initial contents of $GOPATH"
find $GOPATH

BUILD_DIR=./build

go get -u github.com/gorilla/mux

go build -o ${BUILD_DIR}/ ./...

echo "Final contents of $GOPATH"
find $GOPATH

ls -al $BUILD_DIR

echo "Contents of ${BUILD_DIR}
find $BUILD_DIR
