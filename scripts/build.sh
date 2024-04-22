#!/bin/sh


BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/build


mkdir -p ${BUILD_DIR}







go get -u github.com/gorilla/mux
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "go get failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi



export GOFLAGS=-buildvcs=false

go build -o ./build ./...
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "go build failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

