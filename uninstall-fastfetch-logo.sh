#!/bin/bash

CONFIG_DIR="$HOME/.config/fastfetch"
CONFIG_FILE="$CONFIG_DIR/config.jsonc"

echo "=== FASTFETCH CONFIG RESTORATION ==="

# 1. FIND THE LATEST BACKUP
# ls -t sorts files by modification time (newest first). head -n 1 grabs the top result.
LATEST_BACKUP=$(ls -t "$CONFIG_DIR"/config.jsonc.bak_* 2>/dev/null | head -n 1)

if [[ -n "$LATEST_BACKUP" ]]; then
    echo "[-] Found the most recent backup: $(basename "$LATEST_BACKUP")"
    
    # 2. RESTORE THE BACKUP
    mv "$LATEST_BACKUP" "$CONFIG_FILE"
    echo "[+] Successfully restored configuration from backup!"
    
elif [[ -f "$CONFIG_FILE" ]]; then
    # 3. HANDLE CASE: NO BACKUP EXISTS, BUT CUSTOM CONFIG DOES
    echo "[-] No backup files found, but a custom config exists."
    echo "    This usually means you didn't have a personal config before running the setup."
    echo "    Deleting this custom config will restore Omarchy's default system logo."
    
    read -p "Do you want to delete the current custom config? (y/N): " CONFIRM
    if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
        rm "$CONFIG_FILE"
        echo "[+] Custom config deleted. System will now use default Omarchy settings."
    else
        echo "[!] Restoration aborted."
        exit 0
    fi
else
    # 4. HANDLE CASE: NOTHING TO RESTORE
    echo "[!] No custom config or backups found."
    echo "    Your system is already using the default settings."
fi

echo "    Run the 'fastfetch' command to verify."
