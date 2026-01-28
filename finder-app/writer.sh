#!/bin/bash

set -x

if [ "$#" -ne 2 ]; then
    echo "Error: Script requires 2 arguments."
    echo "Usage: $0 <filename> <string>"
    exit 1
fi

writefile=$1
writestr=$2
writefile_dir=$(dirname "$writefile")

mkdir -p "$writefile_dir"

if [ $? -ne 0 ]; then
    echo "Error: Directory $writefile_dir could not created"
    exit 1
fi

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
    echo "Error: File $writefile could not be create"
    exit 1
fi
