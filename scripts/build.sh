#!/bin/bash

set -x 

BUILD_DIR=./build

go get -u github.com/gorilla/mux

go build -o ${BUILD_DIR}/ ./...

ls -al /go
ls -al /go/bin
ls -al /go/pkg
ls -al /go/src

pwd
echo "GOROOT = $GOROOT"
echo "GOPATH = $GOPATH"

ls -al $BUILD_DIR
