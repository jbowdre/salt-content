#!/usr/bin/env bash

curl \
  -H "Authorization: Bearer {{ ntfy_token }}" \
  -H "Title: $1" \
  -d "$2" \
  {{ ntfy_url }}

