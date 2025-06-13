return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "storm",
      styles = {
        -- what
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none
        colors.comment = "#5dcfff"
        colors.bg_highlight = "#2f334d"
      end,
    },
  },
}
