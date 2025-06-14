return {
  {
    "folke/tokyonight.nvim",

    ---@class tokyonight.Config
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
        colors.comment = colors.fg
      end,

      on_highlights = function(highlights, colors)
        -- look into tokyonight.nvim/extras/lua/tokyonight_<theme>.lua
        highlights.LspInlayHint = {
          bg = colors.none,
          fg = "#fca7ea",
          italic = true,
        }
        highlights.DiagnosticVirtualTextError.bg = colors.none
        highlights.DiagnosticVirtualTextHint.bg = colors.none
        highlights.DiagnosticVirtualTextInfo.bg = colors.none
        highlights.DiagnosticVirtualTextWarn.bg = colors.none
      end,
    },
  },
}
