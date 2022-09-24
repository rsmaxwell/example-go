#!/bin/bash

NAME=example-go
BUILD_DIR=./build
GOOS=$(go env GOOS)
GOARCH=$(go env GOENV)
GOEXE=$(go env GOEXE)

set -x 

go build -o ${BUILD_DIR} ./...

echo "BUILD_DIR = ${BUILD_DIR}"
ls -al ${BUILD_DIR}
