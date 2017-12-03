#!/bin/bash -x
if [ "x" = "${1}x" ]; then
  echo "no value (hostname / ip) passed 127.0.0.1 will remain."
else
  sed -i -e "s|127.0.0.1|${1}|g" book.json
fi
