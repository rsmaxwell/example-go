#!/bin/bash

set -x 

echo "Initial contents of $GOPATH"
find $GOPATH

BUILD_DIR=./build

go get -u github.com/gorilla/mux

go build -o ${BUILD_DIR}/ ./...

echo "Final contents of $GOPATH"
find $GOPATH

pwd

echo "GOROOT = $(go env GOROOT)"
echo "GOPATH = $(go env GOPATH)"

ls -al $BUILD_DIR
