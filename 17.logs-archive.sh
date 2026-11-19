#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "either source dir or dest dir is empty"
    echo "USAGE:$0 [SOURCE_DIR] [ DEST_DIR ] [ DAYS ]"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "source dirctory: $SOURCE_DIR does not exist"
    exit 1
fi
if [ ! -d "$DEST_DIR" ]; then
    echo " destination directory: $DEST_DIR does not exist"
    exit 1
fi

FILES=$(find . -type f -name "*.log" -mtime +14)

if [ -z "$FILES" ]; then
    echo " log files older than 14 days not found, nothing to do"
    exit 0
else

