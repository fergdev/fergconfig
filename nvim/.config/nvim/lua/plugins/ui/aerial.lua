vim.keymap.set("n", "<leader>tw", function() require("aerial").snacks_picker() end, { desc = "Snacks: Pick symbol from Aerial" })
vim.keymap.set("n", "<leader>ta", ":AerialToggle<CR>", {desc = "Aerial view of file"})

return {
  "stevearc/aerial.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nfim-tree/nvim-web-devicons",
    "folke/snacks.nvim",
  },
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
  },
}
