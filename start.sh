#!/usr/bin/env bash

stow \
  --dir fortressonesv/fortress/stow/ \
  --target /fortressonesv/fortress/ \
  --stow fortress \
  && fortressonesv/fteqw-sv "$@"
