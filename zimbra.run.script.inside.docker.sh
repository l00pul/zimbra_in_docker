#!/usr/bin/env bash
# run custom compiled zimbra  inside a docker secure cage
# l00pul#icloud.com 
die() {
    echo $*
    exit 1
}
docker run \
  -it \
  --env ZIMBRA_BUILDER_UID=$(id -u) \
  --env ZIMBRA_BUILDER_GID=$(id -g) \
  --env ZM_BUILD_RELEASE_NO='10.0.7' \
  -v ~/.ssh:/home/build/.ssh:ro \
  -v $(pwd):/usr/local/zimbra-foss-builder:ro \
  -v $(pwd)/BUILDS:/home/build/installer-build/BUILDS:rw \
  zimbra-smart-ubuntu-20.04-builder:latest