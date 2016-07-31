#!/bin/bash

set -euo pipefail

qemu_user_static_version="v2.6.0"
script_dir=$(dirname "$0")
(
  cd "$script_dir"
  curl -LO "https://github.com/multiarch/qemu-user-static/releases/download/${qemu_user_static_version}/x86_64_qemu-arm-static.tar.gz"
  tar xfvz "x86_64_qemu-arm-static.tar.gz"
  docker build -t docker-alpine-armhf-abuild .
  /bin/rm -f qemu-arm-static
  /bin/rm -f x86_64_qemu-arm-static.tar.gz
)
