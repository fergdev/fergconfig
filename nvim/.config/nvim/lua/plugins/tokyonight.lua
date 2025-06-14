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
        -- colors.bg_highlight = colors.none -- the current line
        colors.comment = "#5dcfff"
      end,

      on_highlights = function(hl, colors)
        -- look into tokyonight.nvim/extras/lua/tokyonight_<theme>.lua
        hl.LspInlayHint = {
          bg = colors.none,
          fg = "#fca7ea",
          -- bold = true,
          italic = true,
        }
      end,
    },
  },
}
