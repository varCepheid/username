#!/bin/bash
# zip.sh — validate each line of a file containing usernames

INPUT_FILE=${1:-username-input}

# Check if the file exists
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: file '$INPUT_FILE' not found."
  exit 1
fi

while read -r username; do
  if echo "$username" | grep -Eq "^[a-z][a-z0-9_]{2,11}$"; then
    echo "$username is a valid username"
  else
    echo "$username is an invalid username"
  fi
done < "$INPUT_FILE"
