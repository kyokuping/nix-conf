#!/bin/bash

: "${TARGET_ROOT:=/tmp/default_path}"

if [[ ! -d "$TARGET_ROOT" ]]; then
    echo "Target directory does not exist: $TARGET_ROOT"
    exit 0
fi

for repo in "$TARGET_ROOT"/*/; do
    repo_path="${repo%/}"

    if [[ -d "$repo_path/.git" ]]; then

        # -mtime +30: modified more than 30 days ago
        # -atime -30: accessed within the last 30 days
        if [[ $(find "$repo_path/.git" -maxdepth 0 -mtime +30) ]] && \
           [[ -z $(find "$repo_path" -maxdepth 2 -not -path '*/.*' -atime -30) ]]; then
            echo "Removing inactive repo: $repo_path"
            rm -rf "$repo_path"
        fi
    fi
done
