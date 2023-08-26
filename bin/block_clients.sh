#!/bin/bash

BANNED_FILE="/usr/local/bin/banned_clients.txt"

# If banned file doesn't exist, allow connection
[ -e "$BANNED_FILE" ] || exit 0

BANNED_CLIENTS=($(cat "$BANNED_FILE"))

for banned in "${BANNED_CLIENTS[@]}"; do
    if [[ "$common_name" == "$banned" ]]; then
        exit 1
    fi
done

exit 0
