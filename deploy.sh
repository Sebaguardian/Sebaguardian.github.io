#! /usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo 'where seber?????????'
  exit 2
fi

rm -rf public

git submodule update --init --recursive
hugo build
rsync -avz --delete --chmod=D755,F644 public/ "$1:."
echo 'deployeded :3'
