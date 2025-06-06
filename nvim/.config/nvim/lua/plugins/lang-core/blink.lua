return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      {
        "fang2hou/blink-copilot",
        opts = {
          max_completions = 3, -- Global default for max completions
          max_attempts = 2, -- Global default for max attempts
          debounce = 100, -- Global default for debounce time
        },
      },
      {
        "xzbdmw/colorful-menu.nvim",
        dependencies = { "onsails/lspkind-nvim" },
      },
    },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
    config = function()
      require("blink.cmp").setup({
        completion = {
          menu = {
            border = "single",
          },
          documentation = {
            auto_show = true,
            window = {
              border = "single",
            },
          },
        },
        signature = { enabled = true },
        sources = {
          -- default = { "lsp", "path", "snippets", "buffer", "copilot" },
          default = { "lsp", "path", "snippets", "buffer" },
          per_filetype = {
            sql = { "snippets", "dadbod", "buffer" },
          },
          providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
            },
          },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
      })
    end,
  },
}
