#!/bin/bash

set -x

set | grep GO

echo 

BUILD_DIR=../build
GOOS=$(go env GOOS)
GOARCH=$(go env GOENV)
GOEXE=$(go env GOEXE)


mkdir -p ${BUILD_DIR}


go build -o ${BUILD_DIR}/${PROJECT_NAME}-${GOOS}-${GOARCH}${GOEXE} ./...
