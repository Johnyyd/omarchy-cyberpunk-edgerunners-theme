#!/bin/bash

# 1. PATH RESOLUTION: Get the absolute path of the directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
THEME_LOGO="$HOME/.config/omarchy/themes/cyberpunk-edgerunners/fastfetch-logo.png"

if [[ -f "$THEME_LOGO" ]]; then
    DEFAULT_LOGO="$THEME_LOGO"
else
    DEFAULT_LOGO="$SCRIPT_DIR/fastfetch-logo.png"
fi

CONFIG_DIR="$HOME/.config/fastfetch"
CONFIG_FILE="$CONFIG_DIR/config.jsonc"

echo "=== FASTFETCH LOGO CONFIGURATOR ==="

# 2. HANDLE USER INPUT
LOGO_PATH=""
if [[ "${1:-}" == "-y" || "${1:-}" == "--default" || ! -t 0 ]]; then
    LOGO_PATH="$DEFAULT_LOGO"
    echo "[-] Auto-selecting default logo: $LOGO_PATH"
else
    read -p "Enter the absolute path to the logo image (leave blank to use default): " USER_INPUT
    if [[ -z "$USER_INPUT" ]]; then
        LOGO_PATH="$DEFAULT_LOGO"
        echo "[-] Using default logo: $LOGO_PATH"
    else
        LOGO_PATH="${USER_INPUT/#\~/$HOME}"
        echo "[-] Using custom logo: $LOGO_PATH"
    fi
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
    "separator": "  ",
    "color": {
      "separator": "bright_cyan",
      "keys": "bright_magenta",
      "title": "bright_yellow"
    }
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
