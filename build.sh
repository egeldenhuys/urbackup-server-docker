#!/bin/bash
set -x

# Accepted values for ARCH are amd64, armhf, arm64, i386
ARCH=${1:-amd64}
VERSION=${2:-2.4.13}
TARGETPLATFORM="linux/${ARCH}"

docker build \
              --build-arg ARCH=${ARCH} \
              --build-arg VERSION=${VERSION} \
              --build-arg IMAGE_ARCH=$([ "${ARCH}" == "armhf" ] && echo "arm32v7/debian:stretch" || ([ "${ARCH}" == "arm64" ] && echo "arm64v8/debian:stretch") || ([ "${BUILD_ARCH}" == "i386" ] && echo "i386/debian:stretch") || echo "debian:stretch") \
              --build-arg TARGETPLATFORM=${TARGETPLATFORM} \
              -t urbackup-server:${VERSION}_${ARCH} \
              .
