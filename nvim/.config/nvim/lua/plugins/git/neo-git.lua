vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { desc = "Git status" })

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "folke/snacks.nvim",
  },
  opts = {
    integrations = {
      diffview = true,
    },
  },
}
