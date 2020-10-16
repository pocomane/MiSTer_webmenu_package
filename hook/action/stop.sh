#/usr/bin/env bash

EXE_NAME="MiSTer_WebMenu"

die(){
  echo "ERROR $1"
  exit 127
}

PID=$(ps ax -o pid,comm | grep "$EXE_NAME"| grep -oh '^[ \t]*[0-9]*' | grep -oh '[0-9]*')

if [ "$PID" = "" ]; then
  false ||die "can not find any running instance"
fi
kill -09 "$PID" ||die "can not stop process '$PID'"

