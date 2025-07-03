#!/bin/bash

set -e  # Exit langsung jika ada error

# Path script md2pdf lokal & global
SCRIPT_NAME="md2pdf"
LOCAL_PATH="./$SCRIPT_NAME"
DEST_PATH="/usr/local/bin/$SCRIPT_NAME"

if [ ! -f "$LOCAL_PATH" ]; then
  echo "❌ File $LOCAL_PATH tidak ditemukan!"
  exit 1
fi

echo "🚀 Deploy $SCRIPT_NAME ke $DEST_PATH ..."
sudo cp "$LOCAL_PATH" "$DEST_PATH"
sudo chmod +x "$DEST_PATH"

echo "✅ Deploy selesai! Sekarang kamu bisa pakai: $SCRIPT_NAME"
