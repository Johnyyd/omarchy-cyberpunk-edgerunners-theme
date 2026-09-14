#!/bin/bash

# 1. PATH RESOLUTION: Get the absolute path of the directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DEFAULT_LOGO="$SCRIPT_DIR/fastfetch-logo.png"

CONFIG_DIR="$HOME/.config/fastfetch"
CONFIG_FILE="$CONFIG_DIR/config.jsonc"

echo "=== FASTFETCH LOGO CONFIGURATOR ==="

# 2. HANDLE USER INPUT
read -p "Enter the absolute path to the logo image (leave blank to use default): " USER_INPUT

# If the user leaves it blank, assign the default file
if [[ -z "$USER_INPUT" ]]; then
    LOGO_PATH="$DEFAULT_LOGO"
    echo "[-] Using default logo: $LOGO_PATH"
else
    # Support the tilde (~) expansion for /home/username
    LOGO_PATH="${USER_INPUT/#\~/$HOME}"
    echo "[-] Using custom logo: $LOGO_PATH"
fi

# 3. DATA INTEGRITY CHECK
if [[ ! -f "$LOGO_PATH" ]]; then
    echo "[!] ERROR: Image file not found at $LOGO_PATH"
    echo "    Please verify the path. Aborting!"
    exit 1
fi

# 4. PROTECT USER DATA (BACKUP)
mkdir -p "$CONFIG_DIR"
if [[ -f "$CONFIG_FILE" ]]; then
    BACKUP_FILE="$CONFIG_DIR/config.jsonc.bak_$(date +%Y%m%d_%H%M%S)"
    mv "$CONFIG_FILE" "$BACKUP_FILE"
    echo "[+] Backed up your previous configuration to: $BACKUP_FILE"
fi

# 5. GENERATE NEW CONFIGURATION
# Use Here-Doc to write the JSONC block into the new file
cat << EOF > "$CONFIG_FILE"
{
  "\$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "logo": {
    "type": "kitty",
    "source": "$LOGO_PATH",
    "width": 32,
    "height": 18,
    "padding": {
      "top": 1,
      "right": 6,
      "left": 2
    }
  },
  "display": {
    "separator": "  "
  },
  "modules": [
    "title",
    "separator",
    "os",
    "host",
    "kernel",
    "uptime",
    "packages",
    "shell",
    "display",
    "wm",
    "theme",
    "icons",
    "font",
    "cursor",
    "terminal",
    "cpu",
    "gpu",
    "memory",
    "disk",
    "break",
    "colors"
  ]
}
EOF

echo "[+] DONE! Fastfetch configuration created at $CONFIG_FILE"
echo "    Run the 'fastfetch' command to see the result."
