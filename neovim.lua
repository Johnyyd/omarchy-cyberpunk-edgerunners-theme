return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg = "#26173E",
        dark_bg = "#26173E",
        darker_bg = "#26173E",
        lighter_bg = "#28187D",

        fg = "#46FEEC",
        dark_fg = "#3D99CA",
        light_fg = "#46FEEC",
        bright_fg = "#46FEEC",
        muted = "#3D99CA",

        red = "#ED4BA8",
        yellow = "#EAE43E",
        orange = "#FFFF4C",
        green = "#51E946",
        cyan = "#02B3F1",
        blue = "#5A4ED6",
        magenta = "#DA11C9",
        brown = "#94007A",

        bright_red = "#ED4BA8",
        bright_yellow = "#FFFF4C",
        bright_green = "#51E946",
        bright_cyan = "#1BD7F8",
        bright_blue = "#5A4ED6",
        bright_magenta = "#B03DCE",

        accent = "#FFFF4C",
        cursor = "#46FEEC",
        foreground = "#46FEEC",
        background = "#26173E",
        selection = "#FFFF4C",
        selection_foreground = "#26173E",
        selection_background = "#FFFF4C",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
