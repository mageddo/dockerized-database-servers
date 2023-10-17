#!/bin/sh

set -e

createNotes() {
  echo "> $(date) creating notes"
  for f in *.md; do \
    
    fname=$(basename $f)
    echo "> processing: ${fname}"
    
    cat $fname | ../node_modules/.bin/hackmd-cli notes create
    mv $f processed

    echo "> processed: ${fname}"
    echo ""

  done
}

case $1 in

  create-notes )
    createNotes
  ;;

  *)
    date
    cd bookmarks
    mkdir -p processed

    while [ true ]; do
      ../batch-create.sh create-notes || echo "Failed, sleeping for 3 minutes"
      
      sleep 60
      echo "> 1 min"
      sleep 60
      echo "> 2 min"
      sleep 60
      echo "> 3 min, trying again"

    done
  ;;

esac
