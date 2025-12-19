#! /usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo 'where seber?????????'
  exit 2
fi

rm -rf public

git submodule update --init --recursive
hugo build
cd public
rsync -avz --delete . "$1:."
cd -
echo 'deployeded :3'
