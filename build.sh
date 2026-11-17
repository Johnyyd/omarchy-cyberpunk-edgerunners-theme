#!/usr/bin/env bash
# Build script for Cyberpunk Edgerunners theme
# Syncs colors.toml (source of truth) to all derived configuration files

set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
COLORS_TOML="$REPO_DIR/colors.toml"

# Extract colors from colors.toml
get_color() {
    local key="$1"
    local line
    line=$(grep -E "^${key}\s*=" "$COLORS_TOML" | head -1)
    if [[ -z "$line" ]]; then
        echo "❌ Error: Color '$key' not found in $COLORS_TOML" >&2
        exit 1
    fi
    # Extract value between quotes, or after = if no quotes
    local value
    if [[ "$line" =~ \"([^\"]+)\" ]]; then
        value="${BASH_REMATCH[1]}"
    else
        value=$(echo "$line" | sed -E 's/.*=\s*//' | sed -E 's/\s*#.*//' | sed -E 's/\s+$//')
    fi
    echo "$value"
}

echo "🔧 Building Cyberpunk Edgerunners theme from $COLORS_TOML"

# Extract key colors
BG="$(get_color 'background')"
FG="$(get_color 'foreground')"
ACCENT="$(get_color 'accent')"
CURSOR="$(get_color 'cursor')"
SEL_BG="$(get_color 'selection_background')"
SEL_FG="$(get_color 'selection_foreground')"
MUTED="$(get_color 'muted')"
LIGHTER_BG="$(get_color 'lighter_bg')"
RED="$(get_color 'red')"
GREEN="$(get_color 'green')"
YELLOW="$(get_color 'yellow')"
BLUE="$(get_color 'blue')"
MAGENTA="$(get_color 'magenta')"
CYAN="$(get_color 'cyan')"
ORANGE="$(get_color 'orange')"
BROWN="$(get_color 'brown')"
DARK_FG="$(get_color 'dark_fg')"
DARK_BG="$(get_color 'dark_bg')"
DARKER_BG="$(get_color 'darker_bg')"
LIGHT_FG="$(get_color 'light_fg')"
BRIGHT_FG="$(get_color 'bright_fg')"
NEON_GREEN="$(get_color 'neon_green')"

# ANSI colors
COLOR0="$(get_color 'color0')"
COLOR1="$(get_color 'color1')"
COLOR2="$(get_color 'color2')"
COLOR3="$(get_color 'color3')"
COLOR4="$(get_color 'color4')"
COLOR5="$(get_color 'color5')"
COLOR6="$(get_color 'color6')"
COLOR7="$(get_color 'color7')"
COLOR8="$(get_color 'color8')"
COLOR9="$(get_color 'color9')"
COLOR10="$(get_color 'color10')"
COLOR11="$(get_color 'color11')"
COLOR12="$(get_color 'color12')"
COLOR13="$(get_color 'color13')"
COLOR14="$(get_color 'color14')"
COLOR15="$(get_color 'color15')"

echo "✅ Extracted palette from colors.toml"

# Helper function to apply color substitutions to a file
apply_substitutions() {
    local file="$1"
    sed -i \
        -e "s/{{ background }}/$BG/g" \
        -e "s/{{ foreground }}/$FG/g" \
        -e "s/{{ accent }}/$ACCENT/g" \
        -e "s/{{ cursor }}/$CURSOR/g" \
        -e "s/{{ selection_background }}/$SEL_BG/g" \
        -e "s/{{ selection_foreground }}/$SEL_FG/g" \
        -e "s/{{ muted }}/$MUTED/g" \
        -e "s/{{ bright_foreground }}/$FG/g" \
        -e "s/{{ bright_red }}/$RED/g" \
        -e "s/{{ bright_green }}/$GREEN/g" \
        -e "s/{{ bright_yellow }}/$COLOR11/g" \
        -e "s/{{ bright_blue }}/$BLUE/g" \
        -e "s/{{ bright_magenta }}/$COLOR13/g" \
        -e "s/{{ bright_cyan }}/$COLOR14/g" \
        -e "s/{{ red }}/$RED/g" \
        -e "s/{{ green }}/$GREEN/g" \
        -e "s/{{ yellow }}/$YELLOW/g" \
        -e "s/{{ blue }}/$BLUE/g" \
        -e "s/{{ magenta }}/$MAGENTA/g" \
        -e "s/{{ cyan }}/$CYAN/g" \
        -e "s/{{ orange }}/$ORANGE/g" \
        -e "s/{{ brown }}/$BROWN/g" \
        -e "s/{{ dark_fg }}/$DARK_FG/g" \
        -e "s/{{ dark_bg }}/$DARK_BG/g" \
        -e "s/{{ darker_bg }}/$DARKER_BG/g" \
        -e "s/{{ light_fg }}/$LIGHT_FG/g" \
        -e "s/{{ bright_fg }}/$BRIGHT_FG/g" \
        -e "s/{{ neon_green }}/$NEON_GREEN/g" \
        -e "s/{{ lighter_bg }}/$LIGHTER_BG/g" \
        -e "s/{{ color0 }}/$COLOR0/g" \
        -e "s/{{ color1 }}/$COLOR1/g" \
        -e "s/{{ color2 }}/$COLOR2/g" \
        -e "s/{{ color3 }}/$COLOR3/g" \
        -e "s/{{ color4 }}/$COLOR4/g" \
        -e "s/{{ color5 }}/$COLOR5/g" \
        -e "s/{{ color6 }}/$COLOR6/g" \
        -e "s/{{ color7 }}/$COLOR7/g" \
        -e "s/{{ color8 }}/$COLOR8/g" \
        -e "s/{{ color9 }}/$COLOR9/g" \
        -e "s/{{ color10 }}/$COLOR10/g" \
        -e "s/{{ color11 }}/$COLOR11/g" \
        -e "s/{{ color12 }}/$COLOR12/g" \
        -e "s/{{ color13 }}/$COLOR13/g" \
        -e "s/{{ color14 }}/$COLOR14/g" \
        -e "s/{{ color15 }}/$COLOR15/g" \
        "$file"
}

# 1. Generate colors.css
cat > "$REPO_DIR/colors.css" <<EOF
/*
 * Cyberpunk Edgerunners shared CSS color variables.
 * Generated from colors.toml — DO NOT EDIT DIRECTLY
 * Source of truth: colors.toml
*/

  /* ANSI palette */
  @define-color color0 $COLOR0;
  @define-color color1 $COLOR1;
  @define-color color2 $COLOR2;
  @define-color color3 $COLOR3;
  @define-color color4 $COLOR4;
  @define-color color5 $COLOR5;
  @define-color color6 $COLOR6;
  @define-color color7 $COLOR7;
  @define-color color8 $COLOR8;
  @define-color color9 $COLOR9;
  @define-color color10 $COLOR10;
  @define-color color11 $COLOR11;
  @define-color color12 $COLOR12;
  @define-color color13 $COLOR13;
  @define-color color14 $COLOR14;
  @define-color color15 $COLOR15;

  /* Optional semantic aliases */
  @define-color background $BG;
  @define-color foreground $FG;
  @define-color accent $ACCENT;
  @define-color selection_bg $SEL_BG;
  @define-color selection_fg $SEL_FG;
  @define-color cursor $CURSOR;
  @define-color green $GREEN;
  @define-color yellow $YELLOW;
  @define-color red $RED;
  @define-color neon_green $NEON_GREEN;
EOF

echo "✅ Generated colors.css"

# 2. Generate shell.toml from template
tpl="shell.toml.tpl"
tpl_path="$REPO_DIR/$tpl"
output_name="${tpl%.tpl}"
output_path="$REPO_DIR/$output_name"
if [[ -f "$tpl_path" ]]; then
    cp "$tpl_path" "$output_path"
    apply_substitutions "$output_path"
    echo "  ✅ Generated $output_name from $tpl"
fi

echo "✅ Generated shell.toml from template"

# 3. Generate neovim.lua from template
tpl="neovim.lua.tpl"
tpl_path="$REPO_DIR/$tpl"
output_name="${tpl%.tpl}"
output_path="$REPO_DIR/$output_name"
if [[ -f "$tpl_path" ]]; then
    cp "$tpl_path" "$output_path"
    apply_substitutions "$output_path"
    echo "  ✅ Generated $output_name from $tpl"
fi

echo "✅ Generated neovim.lua from template"

# 4. Generate helix.toml palette
sed -i \
    -e "s/background = \"#[A-Fa-f0-9]*\"/background = \"$BG\"/" \
    -e "s/foreground = \"#[A-Fa-f0-9]*\"/foreground = \"$FG\"/" \
    -e "s/lighter_background = \"#[A-Fa-f0-9]*\"/lighter_background = \"$LIGHTER_BG\"/" \
    -e "s/cursor = \"#[A-Fa-f0-9]*\"/cursor = \"$CURSOR\"/" \
    -e "s/selection_background = \"#[A-Fa-f0-9]*\"/selection_background = \"$SEL_BG\"/" \
    -e "s/selection_foreground = \"#[A-Fa-f0-9]*\"/selection_foreground = \"$SEL_FG\"/" \
    -e "s/color0 = \"#[A-Fa-f0-9]*\"/color0 = \"$COLOR0\"/" \
    -e "s/color1 = \"#[A-Fa-f0-9]*\"/color1 = \"$COLOR1\"/" \
    -e "s/color2 = \"#[A-Fa-f0-9]*\"/color2 = \"$COLOR2\"/" \
    -e "s/color3 = \"#[A-Fa-f0-9]*\"/color3 = \"$COLOR3\"/" \
    -e "s/color4 = \"#[A-Fa-f0-9]*\"/color4 = \"$COLOR4\"/" \
    -e "s/color5 = \"#[A-Fa-f0-9]*\"/color5 = \"$COLOR5\"/" \
    -e "s/color6 = \"#[A-Fa-f0-9]*\"/color6 = \"$COLOR6\"/" \
    -e "s/color7 = \"#[A-Fa-f0-9]*\"/color7 = \"$COLOR7\"/" \
    -e "s/color8 = \"#[A-Fa-f0-9]*\"/color8 = \"$COLOR8\"/" \
    -e "s/color9 = \"#[A-Fa-f0-9]*\"/color9 = \"$COLOR9\"/" \
    -e "s/color10 = \"#[A-Fa-f0-9]*\"/color10 = \"$COLOR10\"/" \
    -e "s/color11 = \"#[A-Fa-f0-9]*\"/color11 = \"$COLOR11\"/" \
    -e "s/color12 = \"#[A-Fa-f0-9]*\"/color12 = \"$COLOR12\"/" \
    -e "s/color13 = \"#[A-Fa-f0-9]*\"/color13 = \"$COLOR13\"/" \
    -e "s/color14 = \"#[A-Fa-f0-9]*\"/color14 = \"$COLOR14\"/" \
    -e "s/color15 = \"#[A-Fa-f0-9]*\"/color15 = \"$COLOR15\"/" \
    "$REPO_DIR/helix.toml"

echo "✅ Updated helix.toml"

# 5. Generate obsidian.css (selection only)
sed -i \
    -e "s/--text-selection: #[A-Fa-f0-9]*;/--text-selection: $SEL_BG;/" \
    "$REPO_DIR/obsidian.css"

echo "✅ Updated obsidian.css"

# 6. Generate hyprland-preview-share-picker.css (selected_tab only)
sed -i \
    -e "s/@define-color selected_tab #[A-Fa-f0-9]*;/@define-color selected_tab $SEL_BG;/" \
    "$REPO_DIR/hyprland-preview-share-picker.css"

echo "✅ Updated hyprland-preview-share-picker.css"

# 7. Process terminal template files (copy and substitute, don't modify originals)
template_files=(kitty.conf.tpl ghostty.conf.tpl foot.ini.tpl alacritty.toml.tpl)

# 7b. Process additional template files
extra_templates=(
    "btop.theme.tpl:btop.theme"
    "mako.ini.tpl:mako.ini"
    "hyprlock.conf.tpl:hyprlock.conf"
    "swayosd.css.tpl:swayosd.css"
    "fastfetch.jsonc.tpl:fastfetch.jsonc"
    "gum_env.lua.tpl:gum_env.lua"
    "cava_theme.tpl:cava_theme"
    "shell.toml.tpl:shell.toml"
    "neovim.lua.tpl:neovim.lua"
)

for tpl in "${template_files[@]}"; do
    tpl_path="$REPO_DIR/$tpl"
    if [[ -f "$tpl_path" ]]; then
        # Determine output filename (remove .tpl extension)
        output_name="${tpl%.tpl}"
        output_path="$REPO_DIR/$output_name"

        # Copy template and substitute variables
        cp "$tpl_path" "$output_path"
        apply_substitutions "$output_path"

        echo "  ✅ Generated $output_name from $tpl"
    fi
done

echo "✅ Generated terminal config files from templates"

# 7b. Process additional template files
for entry in "${extra_templates[@]}"; do
    tpl="${entry%:*}"
    output_name="${entry#*:}"
    tpl_path="$REPO_DIR/$tpl"
    output_path="$REPO_DIR/$output_name"

    if [[ -f "$tpl_path" ]]; then
        cp "$tpl_path" "$output_path"
        apply_substitutions "$output_path"

        echo "  ✅ Generated $output_name from $tpl"
    fi
done

echo "✅ Generated additional config files from templates"

# 8. Validate key colors in generated files
echo ""
echo "🔍 Validating color consistency..."
SEL_BG_NO_HASH="${SEL_BG#\#}"
FAILED=0

# Check background in terminal configs
for file in \
    "$REPO_DIR/kitty.conf" \
    "$REPO_DIR/ghostty.conf" \
    "$REPO_DIR/foot.ini" \
    "$REPO_DIR/alacritty.toml"
do
    if grep -q "$BG" "$file" 2>/dev/null && grep -q "$FG" "$file" 2>/dev/null; then
        echo "  ✅ $file (bg/fg)"
    else
        echo "  ❌ $file - missing bg/fg"
        FAILED=1
    fi
done

# Check selection color in core synced files (these should have selection_background)
for file in \
    "$REPO_DIR/colors.toml" \
    "$REPO_DIR/colors.css" \
    "$REPO_DIR/neovim.lua" \
    "$REPO_DIR/helix.toml" \
    "$REPO_DIR/obsidian.css" \
    "$REPO_DIR/hyprland-preview-share-picker.css" \
    "$REPO_DIR/shell.toml" \
    "$REPO_DIR/kitty.conf" \
    "$REPO_DIR/ghostty.conf" \
    "$REPO_DIR/foot.ini" \
    "$REPO_DIR/alacritty.toml"
do
    if grep -q "$SEL_BG_NO_HASH" "$file" 2>/dev/null; then
        echo "  ✅ $file (selection)"
    else
        echo "  ❌ $file - missing $SEL_BG"
        FAILED=1
    fi
done

# Check that additional template files have at least one palette color
# Some files use rgba() format, so check both hex and rgba variants
for file in \
    "$REPO_DIR/btop.theme" \
    "$REPO_DIR/mako.ini" \
    "$REPO_DIR/hyprlock.conf" \
    "$REPO_DIR/swayosd.css" \
    "$REPO_DIR/fastfetch.jsonc" \
    "$REPO_DIR/gum_env.lua" \
    "$REPO_DIR/cava_theme"
do
    if grep -qE "$BG|$FG|$ACCENT|$SEL_BG|$SEL_FG|$RED|$GREEN|$YELLOW|$BLUE|$MAGENTA|$CYAN|$ORANGE|$MUTED|$LIGHTER_BG|rgba\(255, 255, 76|rgba\(40, 24, 125|rgba\(70, 254, 236|rgba\(218, 17, 201|rgba\(255, 0, 60" "$file" 2>/dev/null; then
        echo "  ✅ $file (palette)"
    else
        echo "  ❌ $file - missing palette colors"
        FAILED=1
    fi
done

# Check ANSI colors in terminal configs
for file in \
    "$REPO_DIR/kitty.conf" \
    "$REPO_DIR/ghostty.conf" \
    "$REPO_DIR/foot.ini" \
    "$REPO_DIR/alacritty.toml"
do
    if grep -q "$COLOR1" "$file" 2>/dev/null && grep -q "$COLOR2" "$file" 2>/dev/null; then
        echo "  ✅ $file (ansi)"
    else
        echo "  ❌ $file - missing ansi colors"
        FAILED=1
    fi
done

# Check that additional template files have at least one palette color (already done above)
# Note: Some files use different formats (rgba, hex without #, etc.) so we check for any palette color

if [ $FAILED -eq 0 ]; then
    echo ""
    echo "🎉 Build successful! All files synced to colors.toml palette."
    echo "   Background: $BG (Night Void)"
    echo "   Foreground: $FG (Luminous Aqua)"
    echo "   Selection: $SEL_BG / $SEL_FG (Lucy Hot Pink / Cyberpunk Yellow)"
    echo "   Accent: $ACCENT (Vivid Neon Fuchsia)"
else
    echo ""
    echo "⚠️  Some files may need manual review"
    exit 1
fi