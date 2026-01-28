#!/bin/bash

set -x

if [ "$#" -ne 2 ]; then
    echo "Error: Script requires 2 arguments."
    echo "Usage: $0 <files_dir> <search_str>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist"
    exit 1
fi

total=$(find "$filesdir" -mindepth 1 | wc -l)
lines=$(grep -rIo "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $total and the number of matching lines are $lines"
