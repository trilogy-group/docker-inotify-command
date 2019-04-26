#!/usr/bin/env bash

set -e

declare -r image_rep=docker.phx1.jivehosted.com/plops/inotify-command
declare -r image_tag=$(git rev-parse --verify --short HEAD)

echo $image_tag

build_image() {
  echo "Building docker image ${image_rep}:${image_tag}"
  docker build --pull=true --rm -t ${image_rep}:${image_tag} .
}

push_to_registry() {
  echo "Pushing ${image_rep}:${image_tag} to registry"
  docker push ${image_rep}:${image_tag}
}

build_image
push_to_registry
exit 0
