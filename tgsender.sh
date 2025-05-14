#!/bin/sh

chatId=<YOUR_CHAT_ID>
botToken=<YOUR_BOT_TOKEN>

if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_file>"
    exit 1
fi

file_path="$1"

if [ ! -f "$file_path" ]; then
    echo "Error: File not found: $file_path"
    exit 1
fi

echo "Sending $file_path"

curl -F chat_id="$chatId" -F document=@"$file_path" https://api.telegram.org/bot$botToken/sendDocument
