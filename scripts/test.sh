#!/bin/sh

EXECUTABLE=hello
PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
TEST_DIR=${PROJECT_DIR}/test



rm -rf ${TEST_DIR}
mkdir -p ${TEST_DIR}
cd ${TEST_DIR}


${BUILD_DIR}/${EXECUTABLE}
result=$?
if [ ${result} -eq 0 ]; then
    echo "Success" > status.txt
else
    echo "test failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    echo "Failed" > status.txt
    exit 1
fi

echo "Success"
