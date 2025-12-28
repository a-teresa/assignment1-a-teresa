#!/bin/sh
# writer.sh
# Usage: writer.sh <writefile> <writestr>

writefile="$1"
writestr="$2"

# Check arguments
if [ $# -lt 2 ] || [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: missing arguments."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Create directory path if it does not exist
writedir="$(dirname "$writefile")"
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir" || {
        echo "Error: could not create directory path."
        exit 1
    }
fi

# Write string to file (overwrite)
echo "$writestr" > "$writefile" || {
    echo "Error: could not create file."
    exit 1
}

exit 0
