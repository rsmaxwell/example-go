#!/bin/bash

BUILD_DIR=./build

ls -al ${BUILD_DIR}

set -x
${BUILD_DIR}/hello
