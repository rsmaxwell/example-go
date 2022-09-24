#!/bin/bash

NAME=example-go
BUILD_DIR=./build
GOOS=$(go env GOOS)
GOARCH=$(go env GOENV)
GOEXE=$(go env GOEXE)


mkdir -p ${BUILD_DIR}


go build -o ${BUILD_DIR}/${NAME}-${GOOS}-${GOARCH}${GOEXE} ./...
