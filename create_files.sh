#!/bin/bash

# Create a new directory for the repository
mkdir timestamped-files
cd timestamped-files

# Loop to create 365 files and commit each one with a different date
for i in {0..364}; do
  # Calculate the date `i` days ago
  commit_date=$(date -d "$i days ago" +"%Y-%m-%d %H:%M:%S")

  # Create a new file for this day
  filename="file_$i.txt"
  echo "This is file number $i, created $commit_date" > "$filename"

  # Add the file to the repository
  git add "$filename"

  # Commit the file with the specific date
  GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "Add $filename with date $commit_date"
done
