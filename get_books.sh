#!/bin/bash
set -euo pipefail

BUCKET="$1"
BOOK_DIR="$2"

# Create the destination directory
mkdir -p "$BOOK_DIR"

# Copy only .txt files from S3
aws s3 cp "s3://$BUCKET/" "$BOOK_DIR/" \
    --recursive \
    --exclude "*" \
    --include "*.txt"

# Convert the directory to an absolute path
BOOK_DIR=$(realpath "$BOOK_DIR")

# Create the book list with a header
echo "File path" > book_list.txt

# Append all text files in sorted order
find "$BOOK_DIR" -type f -name "*.txt" | sort >> book_list.txt

# Count books without including the header
COUNT=$(($(wc -l < book_list.txt) - 1))

echo "Wrote $COUNT book files to book_list.txt"
