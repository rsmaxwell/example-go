#!/bin/sh

FAMILY=""
ARCHITECTURE=""

case "$(uname -s)" in
    CYGWIN*) FAMILY="cygwin" ;;
    Linux*) 
        . /etc/os-release
        case ${ID} in
            ubuntu) FAMILY="linux" ;;
            alpine) FAMILY="alpine" ;;
            *) FAMILY="linux" ;;
        esac
        ;;
    *) FAMILY="unknown" ;;
esac

case "$(uname -m)" in 
  amd64|x86_64)   ARCHITECTURE="amd64" ;; 
  *) ARCHITECTURE="x86" ;; 
esac 






PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build


mkdir -p ${BUILD_DIR}





cat > ${BUILD_DIR}/buildinfo <<EOL
FAMILY="${FAMILY}"
ARCHITECTURE="${ARCHITECTURE}"
EOL




go get -u github.com/gorilla/mux
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "go get failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi



go build ./...
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "go build failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

echo "listing of: ${BUILD_DIR}"
ls -al ${BUILD_DIR}
cat ${BUILD_DIR}/buildinfo

echo "Success"