local set_md_h_colors = function(highlights, fg, bg)
  local hl_bg = highlights[bg]
  local hl_fg = highlights[fg]

  highlights[bg] = {
    fg = hl_bg.bg,
    bg = hl_fg.fg,
    bold = true,
  }

  highlights[fg] = {
    fg = hl_bg.bg,
    bg = hl_fg.fg,
  }
end

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
        colors.comment = "#a9b1d6"
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

        set_md_h_colors(highlights, "RenderMarkdownH1Fg", "RenderMarkdownH1Bg")
        set_md_h_colors(highlights, "RenderMarkdownH2Fg", "RenderMarkdownH2Bg")
        set_md_h_colors(highlights, "RenderMarkdownH3Fg", "RenderMarkdownH3Bg")
        set_md_h_colors(highlights, "RenderMarkdownH4Fg", "RenderMarkdownH4Bg")
        set_md_h_colors(highlights, "RenderMarkdownH5Fg", "RenderMarkdownH5Bg")
        set_md_h_colors(highlights, "RenderMarkdownH6Fg", "RenderMarkdownH6Bg")
      end,
    },
  },
}
