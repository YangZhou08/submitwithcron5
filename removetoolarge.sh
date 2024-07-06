#!/bin/bash

# Check if a path argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide a path as an argument."
    exit 1
fi

# The path to search in
search_path="$1"

# The size limit in bytes (100MB = 100*1024*1024 bytes)
size_limit=$((100*1024*1024))

# Function to convert bytes to human-readable format
human_readable() {
    local bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes}B"
    elif (( bytes < 1024*1024 )); then
        echo "$((bytes/1024))KB"
    else
        echo "$((bytes/1024/1024))MB"
    fi
}

# Find and remove all .out and .err files larger than 100MB
find "$search_path" -type f \( -name "*.out" -o -name "*.err" \) -size +${size_limit}c | while read -r file; do
    # Get file size
    size=$(stat -f%z "$file")
    human_size=$(human_readable $size)