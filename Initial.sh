#!/bin/sh

TARGET_DIR="."

echo "Directory Analyzer"
echo "=================="
echo "Location: $TARGET_DIR"
echo

file_count=$(find "$TARGET_DIR" -type f | wc -l)
directory_count=$(find "$TARGET_DIR" -type d | wc -l)

total_size=$(find "$TARGET_DIR" -type f -exec wc -c {} + 2>/dev/null | tail -n 1 | awk '{print $1}')

largest_file=$(find "$TARGET_DIR" -type f -exec ls -S {} + 2>/dev/null | head -n 1)

echo "Files: $file_count"
echo "Directories: $directory_count"
echo "Total Size: $total_size bytes"

if [ -n "$largest_file" ]; then
    size=$(wc -c < "$largest_file")
    echo "Largest File: $largest_file"
    echo "Largest Size: $size bytes"
else
    echo "Largest File: None"
fi

echo
echo "Analysis completed."