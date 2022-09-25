#!/bin/bash

set -x 

echo "Initial contents of /go"
find /go

BUILD_DIR=./build

go get -u github.com/gorilla/mux

go build -o ${BUILD_DIR}/ ./...

echo "Final contents of /go"
find /go

pwd

echo "GOROOT = $(go env GOROOT)"
echo "GOPATH = $(go env GOPATH)"

ls -al $BUILD_DIR
