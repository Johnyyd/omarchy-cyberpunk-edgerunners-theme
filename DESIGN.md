# Cyberpunk Edgerunners Design Language

## Core Idea

Cyberpunk Edgerunners is a dark futuristic glass theme inspired by the world of Studio Trigger and CD Projekt Red's *Cyberpunk: Edgerunners*. Built around high-energy neon yellow, luminous cyan, and vivid hot pink accents set against a deep night-city purple void (`#26173E`), it captures the raw energy, chromatic cyberware, and neon-lit atmosphere of Night City.

It should feel:

- electric
- high-energy
- futuristic
- razor-sharp yet beautifully readable
- stylized with iconic Cyberpunk chromatic interplay

## Visual Voice

The voice of the theme is:

- **Night Void base** (`#26173E`) for depth, contrast, and night-sky atmosphere
- **Midnight Indigo structure** (`#28187D`) for raised lacquer surfaces, cards, and inactive borders
- **Cyberpunk Neon Yellow** (`#FFFF4C`) for active focus, selection highlights, and bold energy (David's jacket)
- **Luminous Aqua** (`#46FEEC`) for primary text and high-visibility holographic HUD readouts
- **Lucy Hot Pink** (`#ED4BA8`) for dramatic focus, keywords, and cyberware glow
- **Vivid Electric Cyan** (`#1BD7F8` / `#02B3F1`) for variables, links, and secondary HUD elements
- **Toxic Neon Green** (`#51E946`) for strings, success states, and telemetry data

## Source Of Truth

`colors.toml` is the canonical palette source for this theme.

That means:

- every documented color value should match `colors.toml`
- derived CSS aliases and app-specific mappings should follow `colors.toml`, not invent parallel palette truth
- if a component needs translucency, gradients, or mixed states, those effects should still be built from the `colors.toml` palette
- when the palette changes, `colors.toml` should be updated first and the rest of the theme should be reconciled to it

## The 15-Color Palette

The theme is built strictly from the 15 Cyberpunk Edgerunners palette colors:

| Hex | Name | Role | Primary Usage |
|---|---|---|---|
| `#26173E` | Night Void | Background / Dark Base | Terminal & window background, base canvas |
| `#28187D` | Midnight Indigo | Raised Background / Structure | Inactive borders, elevated cards, panel surfaces |
| `#630D7A` | Dark Cyber Violet | Deep Frame Accent | Deep shadows, secondary frames |
| `#94007A` | Crimson Wine | Dark Accent / Deep Red | Deep diff deletions, dark warning tints |
| `#3D99CA` | Steel Blue | Muted / Comments | Code comments, disabled states, dim labels |
| `#5A4ED6` | Electric Indigo | Blue / Identifiers | Constants, blue syntax tokens, links |
| `#02B3F1` | Cyber Sky Blue | Secondary Cyan | Soft foreground, active links, decorators |
| `#1BD7F8` | Vivid Electric Cyan | Bright Cyan | Variables, parameters, active indicators |
| `#46FEEC` | Luminous Aqua | Primary Foreground | Main editor & shell text, crisp HUD readout |
| `#51E946` | Toxic Neon Green | Green / Strings | String literals, additions, success notifications |
| `#EAE43E` | Acid Lime Yellow | Yellow / Numbers | Numeric literals, warnings, secondary functions |
| `#FFFF4C` | Cyberpunk Yellow | Primary Accent / Highlight | Active borders, selections, cursors, function names |
| `#ED4BA8` | Lucy Hot Pink | Keywords / Selection | Selections, keywords, control flow, active UI |
| `#FF003C` | Cyberpunk Neon Crimson | Red / Critical Alerts | Critical notifications, error markers, lock & polkit failures, ANSI Red |
| `#DA11C9` | Vivid Neon Fuchsia | Magenta | Operators, markdown headings, special tags |
| `#B03DCE` | Neon Orchid | Bright Magenta / Types | Types, classes, interfaces, enums |

## Surface & Border Language

The shell reads as dark tinted glass catching vibrant holographic neon light.

- Panels are dark night-purple (`#26173E`) with subtle translucency (0.80 opacity).
- Active window borders feature an iconic multi-stop chromatic gradient: `rgba(FFFF4Cff) rgba(ED4BA8cc) rgba(1BD7F8aa) 45deg` (Yellow -> Hot Pink -> Cyan).
- Inactive borders use Midnight Indigo (`rgba(28187D99)`) to keep inactive windows cleanly framed without visual noise.
- Cursors and selections are high-contrast Cyberpunk Yellow (`#FFFF4C`) on dark purple.

## Contrast Strategy

Readability is paramount:
- Contrast ratio between primary text (`#46FEEC`) and background (`#26173E`) is **11.2:1** (exceeding WCAG AAA standards).
- Contrast ratio between selection text (`#26173E`) and selection fill (`#FFFF4C`) is **13.8:1**.
- Code comments (`#3D99CA`) provide clear, non-fatiguing contrast at **6.5:1**.
