#!/usr/bin/env bash

rm -rf /fortressonesv/fortress/maps/ \
  && stow \
  --dir /fortressonesv/fortress/stow/ \
  --target /fortressonesv/fortress/ \
  --stow fortress \
  && /fortressonesv/fteqw-sv "$@"
