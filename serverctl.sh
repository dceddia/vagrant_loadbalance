#!/bin/bash

SERVER=$1
COMMAND=$2

function usage() {
  echo "Usage:  $0 <servername> <start|stop>"
  exit
}

if [[ -z "$1" || -z "$2" ]]; then
  usage
fi

if [[ "$2" != "start" && "$2" != "stop" ]]; then
  usage
fi

if [[ "$COMMAND" == "start" ]]; then
  vagrant ssh $SERVER -c "sudo apache2ctl start"
else
  vagrant ssh $SERVER -c "sudo apache2ctl stop"
fi
