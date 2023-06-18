#!/bin/bash

set -e

cd bookmarks
mkdir -p processed

for f in *.md; do \
  
  fname=$(basename $f)
  echo "> processing: ${fname}"
  
  cat $fname | ../node_modules/.bin/hackmd-cli notes create
  mv $f processed

  echo "> processed: ${fname}"
  echo ""

done

