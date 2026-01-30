#!/usr/bin/env bash
# Installs the Puraka icon theme locally for testing purposes.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

SOURCE_DIR="$PROJECT_ROOT/Puraka"
INDEX_FILE="$PROJECT_ROOT/index.theme"
TARGET_DIR="$XDG_DATA_HOME/icons/Puraka"

echo "Installing Puraka icon theme..."
echo "  Source: $SOURCE_DIR"
echo "  Target: $TARGET_DIR"

# Remove existing installation
if [[ -d "$TARGET_DIR" ]]; then
    echo "Removing existing installation..."
    rm -rf "$TARGET_DIR"
fi

# Ensure parent directory exists
mkdir -p "$(dirname "$TARGET_DIR")"

# Copy theme directory
echo "Copying theme files..."
cp -r "$SOURCE_DIR" "$TARGET_DIR"

# Copy index.theme into the theme directory
cp "$INDEX_FILE" "$TARGET_DIR/"

# Update icon cache
echo "Updating icon cache..."
if command -v gtk-update-icon-cache &> /dev/null; then
    gtk-update-icon-cache -f -t "$TARGET_DIR"
else
    echo "  Warning: gtk-update-icon-cache not found, skipping cache update."
fi

echo "Done!"
echo ""
echo "If icons don't update immediately, try:"
echo "  - Logging out and back in"
echo "  - Restarting GNOME Shell (Alt+F2, then 'r' on X11)"
