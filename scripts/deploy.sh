#!/bin/sh

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
DIST_DIR=${PROJECT_DIR}/dist

. ${BUILD_DIR}/buildinfo

PROJECT=example-go
GROUPID=com.rsmaxwell.example
ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
VERSION=${BUILD_ID:-SNAPSHOT}
PACKAGING=zip

REPOSITORY=releases
REPOSITORYID=releases

ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}

cd ${DIST_DIR}

if [ -f ${HOME}/.m2/maven-repository-info ]; then
    . ${HOME}/.m2/maven-repository-info
elif [ -f ./maven-repository-info ]; then
    . ./maven-repository-info
fi

if [ -z "${MAVEN_REPOSITORY_BASE_URL}" ]; then
    echo "'MAVEN_REPOSITORY_BASE_URL' is not defined"
    exit 1
fi

REPOSITORY_URL="${MAVEN_REPOSITORY_BASE_URL}/${REPOSITORY}"

mvn --batch-mode \
	--errors \
	deploy:deploy-file \
	-DgroupId=${GROUPID} \
	-DartifactId=${ARTIFACTID} \
	-Dversion=${VERSION} \
	-Dpackaging=${PACKAGING} \
	-Dfile=${ZIPFILE} \
	-DrepositoryId=${REPOSITORYID} \
	-Durl=${REPOSITORY_URL}

result=$?
if [ ! ${result} -eq 0 ]; then
    echo "deployment failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

echo "Success"

