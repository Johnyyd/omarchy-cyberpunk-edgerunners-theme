# Main background, empty for terminal default, need to be empty if you want transparent background
theme[main_bg]=""

# Main text color
theme[main_fg]="{{ foreground }}"

# Title color for boxes
theme[title]="{{ orange }}"

# Highlight color for keyboard shortcuts (Lucy Hot Pink per design)
theme[hi_fg]="{{ selection_background }}"

# Background color of selected item in processes box
theme[selected_bg]="{{ accent }}"

# Foreground color of selected item in processes box
theme[selected_fg]="{{ background }}"

# Color of inactive/disabled text
theme[inactive_fg]="{{ muted }}"

# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
theme[proc_misc]="{{ accent }}"

# Box outline and divider line color
theme[cpu_box]="{{ selection_background }}"
theme[mem_box]="{{ orange }}"
theme[net_box]="{{ cyan }}"
theme[proc_box]="{{ accent }}"
theme[div_line]="{{ lighter_bg }}"

# Gradient for all meters and graphs
theme[temp_start]="{{ accent }}"
theme[temp_mid]="{{ orange }}"
theme[temp_end]="{{ red }}"

theme[cpu_start]="{{ cyan }}"
theme[cpu_mid]="{{ orange }}"
theme[cpu_end]="{{ red }}"

theme[free_start]="{{ lighter_bg }}"
theme[free_mid]="{{ cyan }}"
theme[free_end]="{{ accent }}"

theme[cached_start]="{{ blue }}"
theme[cached_mid]="{{ cyan }}"
theme[cached_end]="{{ foreground }}"

theme[available_start]="{{ lighter_bg }}"
theme[available_mid]="{{ cyan }}"
theme[available_end]="{{ accent }}"

theme[used_start]="{{ cyan }}"
theme[used_mid]="{{ orange }}"
theme[used_end]="{{ red }}"

theme[download_start]="{{ lighter_bg }}"
theme[download_mid]="{{ cyan }}"
theme[download_end]="{{ foreground }}"

theme[upload_start]="{{ lighter_bg }}"
theme[upload_mid]="{{ magenta }}"
theme[upload_end]="{{ orange }}"