#!/usr/bin/env bash
# build zimbra from source inside a docker secure cage
# l00pul#icloud.com 
die() {
    echo $*
    exit 1
}
git clone https://github.com/maldua/zimbra-foss-builder
cd zimbra-foss-builder
docker build \
  --build-arg ZIMBRA_BUILDER_UID=$(id -u) \
  --build-arg ZIMBRA_BUILDER_GID=$(id -g) \
  --tag zimbra-smart-ubuntu-20.04-builder . \
  -f Dockerfile-smart-ubuntu-20.04