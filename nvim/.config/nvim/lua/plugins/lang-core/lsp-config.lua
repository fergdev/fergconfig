return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- {
    --   "j-hui/fidget.nvim",
    --   opts = {
    --     notification = {
    --       window = {
    --         winblend = 0,
    --       },
    --     },
    --   },
    -- },
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {},
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = {
        "harper_ls",
        "ts_ls",
        "docker_compose_language_service",
        "dockerls",
        "protols",
        "helm_ls",
        "lua_ls",
        "lemminx",
        "bashls",
        "jsonls",
        "yamlls",
        "postgres_lsp",
        "taplo",
      },
    })
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
    local hover = vim.lsp.buf.hover
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.buf.hover = function()
      return hover({
        max_width = 100,
        max_height = 14,
        border = "rounded",
      })
    end
  end,
}
