return {
  "mrcjkb/rustaceanvim",
  lazy = false,
  dependencies = {
    "mfussenegger/nvim-dap",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  on_attach = function(_, _)
    vim.keymap.set("n", ",r", ":RustLsp runnables<CR>", { desc = "Rust runnables" })
    vim.keymap.set("n", ",d", ":RustLsp debuggables<CR>", { desc = "Rust debuggables" })
  end,
  dap = {
    enabled = true,
    setup = function()
      require("rustaceanvim.dap").setup()
    end,
  },
}
