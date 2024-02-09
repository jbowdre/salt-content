#!/usr/bin/env bash

TITLE="$(hostname -s)"
MESSAGE="System boot complete"

/usr/local/bin/ntfy_push.sh "$TITLE" "$MESSAGE"

