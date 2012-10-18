#!/bin/bash

while true; do
  curl -s -f http://10.0.1.40 > /dev/null
  if [ $? -eq 0 ]; then
    echo "Site is UP!"
  else
    echo "Site is DOWN!"
  fi
  sleep 1
done
