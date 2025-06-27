return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "julia-lsp" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          filetypes = { "julia" },
        },
      },
    },
  },
}
