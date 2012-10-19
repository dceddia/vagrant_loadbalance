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

if [[ "$2" != "start" && "$2" != "stop" && "$2" != "status" ]]; then
  usage
fi

if [[ "$COMMAND" == "start" ]]; then
  vagrant ssh $SERVER -c "sudo apache2ctl start"
elif [[ "$COMMAND" == "stop" ]]; then
  vagrant ssh $SERVER -c "sudo apache2ctl stop"
else
  vagrant ssh $SERVER -c "sudo apache2ctl status"
fi
