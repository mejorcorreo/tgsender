#!/bin/bash

chatId=***REMOVED***
botToken=***REMOVED***

if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_file>"
    exit 1
fi

file_path="$1"

if [ ! -f "$file_path" ]; then
    echo "Error: File not found: $file_path"
    exit 1
fi

filename=$(basename "$file_path")
username=$(basename "$(dirname "$file_path")")
date_str=$(date '+%Y-%m-%d')

if echo "$filename" | grep -qi "routes"; then
    caption="🧭 *Маршруты* для \`$username\` от $date_str"
else
    caption="📄 *Конфигурация WireGuard* для \`$username\` от $date_str"
fi

echo "Sending $file_path"

curl -s -X POST "https://api.telegram.org/bot$botToken/sendDocument" \
  -F chat_id="$chatId" \
  -F document=@"$file_path" \
  -F caption="$caption" \
  -F parse_mode="Markdown"

