# Cyberpunk Edgerunners Theme
# Neon fuchsia leads focus and borders; dark purple void provides depth and contrast.

[bar]
background       = "{{ background }}"
background-alpha = 0.85
text             = "{{ foreground }}"
placeholder      = "{{ muted }}"
scale-with-font  = true
border           = "{{ accent }}"
border-active    = "hyprland.active-border"

border-alpha     = 0.88
active-border-foreground = "rgb(DA11C9) rgb(FFFF4C) 45deg"

[controls]
normal-color        = "{{ muted }}"
normal-fill-alpha   = 0.05
normal-border       = "{{ accent }}"
normal-border-width = 0
normal-border-alpha = 0.0

hover-cursor-color        = "{{ foreground }}"
hover-cursor-fill-alpha   = 0.10
hover-cursor-border       = "{{ lighter_bg }}"
hover-cursor-border-width = 0
hover-cursor-border-alpha = 0.0
hover-text                 = "{{ red }}"

focus-color        = "{{ accent }}"
focus-fill-alpha   = 0.13
focus-border       = "hyprland.active-border-foreground"
focus-border-width = 1
focus-border-alpha = 0.72

selected-color        = "{{ selection_background }}"
selected-fill-alpha   = 0.35
selected-border       = "{{ selection_background }}"
selected-border-width = "0 0 1 0"
selected-border-alpha = 0.82
selected-text             = "{{ selection_foreground }}"

pressed-fill-alpha   = 0.24
selection-fill-alpha = 0.34

[spacing]
# Slightly plush, but still compact enough for a daily-driver shell.
scale = 1.08
scale-with-font = true
control-gap       = 9
control-padding-x = 12
control-padding-y = 7
input-padding-y   = 8
control-height    = 31
popup-row-height  = 32
row-gap           = 9
row-padding-x     = 14
label-gap         = 5
panel-gap         = 16
panel-padding     = 20
popup-padding     = 17

[font]
base-size     = 12
caption       = 10
body-small    = 11
body          = 12
subtitle      = 13
title         = 15
heading       = 18
display       = 26
display-large = 31
icon-small    = 11
icon          = 14
icon-large    = 19

[popups]
background       = "{{ background }}"
background-alpha = 0.96
text             = "{{ foreground }}"
border           = "hyprland.active-border"
border-alpha     = 0.78
border-width     = 2

[tooltip]
background       = "{{ background }}"
background-alpha = 0.96
text             = "{{ foreground }}"
border           = "{{ accent }}"
border-alpha     = 0.68

[notifications]
background       = "{{ background }}"
background-alpha = 0.96
text             = "{{ foreground }}"
border           = "hyprland.active-border"
border-alpha     = 0.78
border-width     = 2
countdown        = "{{ selection_background }}"

[launcher]
background                = "{{ background }}"
background-alpha          = 0.96
text                      = "{{ foreground }}"
border                    = "hyprland.active-border"
border-alpha              = 0.78
border-width              = 2
scrim                     = "{{ background }}"
scrim-alpha               = 0.45
selected-background       = "{{ selection_background }}"
selected-background-alpha = 0.18
selected-text             = "{{ selection_foreground }}"
selected-border           = "{{ selection_background }}"
selected-border-alpha     = 0.75
selected-border-width     = 1

[menu]
background                = "{{ background }}"
background-alpha          = 0.96
text                      = "{{ foreground }}"
border                    = "hyprland.active-border"
border-alpha              = 0.78
border-width              = 2
scrim                     = "{{ background }}"
scrim-alpha               = 0.45
selected-background       = "{{ selection_background }}"
selected-background-alpha = 0.18
selected-text             = "{{ selection_foreground }}"
selected-border           = "{{ selection_background }}"
selected-border-alpha     = 0.75
selected-border-width     = 1

[polkit]
background       = "{{ background }}"
background-alpha = 1.0
text             = "{{ foreground }}"
text-error       = "{{ red }}"
border           = "hyprland.active-border"
border-error     = "{{ red }}"
border-alpha     = 0.88
scrim            = "{{ background }}"
scrim-alpha      = 0.66
accent           = "{{ accent }}"

[lock]
background       = "{{ background }}"
background-alpha = 0.20
text             = "{{ foreground }}"
placeholder      = "{{ muted }}"
text-error       = "{{ red }}"
border           = "{{ accent }}"
border-active    = "hyprland.active-border"
border-error     = "{{ red }}"
border-alpha     = 0.88
selection        = "{{ selection_background }}"
selection-alpha  = 0.40

[image-picker]
scrim                   = "{{ background }}"
scrim-alpha             = 0.66
text                    = "{{ foreground }}"
selected-border         = "hyprland.active-border"
selected-border-alpha   = 1.0
unselected-border       = "{{ selection_background }}"
unselected-border-alpha = 0.42