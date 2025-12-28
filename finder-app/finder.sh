#!/bin/sh
# finder.sh
# Usage: finder.sh <filesdir> <searchstr>

filesdir="$1"
searchstr="$2"

# Validate args
if [ $# -lt 2 ] || [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: missing arguments."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Validate directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# Count files (recursive)
X=$(find "$filesdir" -type f 2>/dev/null | wc -l)

# Count matching lines across all files (recursive)
# grep -r searches recursively; -n not needed; -h hides filenames; -s suppresses errors
Y=$(grep -Rhs -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
exit 0
