return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, _)
        hl.Comment = { fg = "#808080" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
      vim.api.nvim_set_hl(0, "CopilotSuggestion", {
        fg = "#808080",
        ctermfg = 8,
        force = true,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,

    opts = {},
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
    priority = 1000,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
  },
  { "datsfilipe/vesper.nvim", lazy = true },
  {
    "sontungexpt/witch",
    priority = 1000,
    lazy = true,
    config = function(_, opts)
      require("witch").setup(opts)
    end,
  },
  {
    "rafamadriz/neon",
    lazy = true,
    priority = 1000,
  },
  {
    "marko-cerovac/material.nvim",
  },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "sainnhe/edge" },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      -- Enable theme
      require("onedark").load()
    end,
  },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable",
    lazy = true,
    priority = 1000,
  },
}
