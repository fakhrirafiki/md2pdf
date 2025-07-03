#!/bin/bash

set -e  # Exit langsung jika ada error

SCRIPT_NAME="md2pdf"
LOCAL_PATH="./$SCRIPT_NAME"
DEST_PATH="/usr/local/bin/$SCRIPT_NAME"
THEMES_PATH="./themes"
THEMES_DEST="/usr/local/bin/themes"

if [ ! -f "$LOCAL_PATH" ]; then
  echo "❌ File $LOCAL_PATH tidak ditemukan!"
  exit 1
fi

echo "🚀 Deploy $SCRIPT_NAME ke $DEST_PATH ..."
sudo cp "$LOCAL_PATH" "$DEST_PATH"
sudo chmod +x "$DEST_PATH"

if [ -d "$THEMES_PATH" ]; then
  echo "🚀 Deploy themes ke $THEMES_DEST ..."
  sudo rm -rf "$THEMES_DEST" # Hapus theme lama, supaya selalu sinkron!
  sudo cp -R "$THEMES_PATH" "$THEMES_DEST"
else
  echo "⚠️  Folder themes/ tidak ditemukan!"
fi

echo "✅ Deploy selesai! Sekarang kamu bisa pakai: $SCRIPT_NAME"
