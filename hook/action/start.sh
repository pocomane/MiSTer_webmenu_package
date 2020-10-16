#/usr/bin/env bash

EXE_NAME="MiSTer_WebMenu"
EXE_PATH="../MiSTer_WebMenu/$EXE_NAME"

die(){
  echo "ERROR $1"
  exit 127
}

PID=$(ps ax -o pid,comm | grep "$EXE_NAME"| grep -oh '^[ \t]*[0-9]*' | grep -oh '[0-9]*')

if [ "$PID" != "" ]; then
  false ||die "there is an instance already running"
fi
( (nohup $EXE_PATH > "./$EXE_NAME.log" 2>&1) &) ||die "can not start the instance"
sleep 1
tail  "./$EXE_NAME.log"

