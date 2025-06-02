return {
  "stevearc/overseer.nvim",
  enabled = false,
  opts = {
    bundles = {
      save_task_opts = {
        bundleable = true,
      },
      autostart_on_load = false,
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)

    -- Keymaps
    vim.keymap.set("n", ",o", "<cmd>OverseerToggle<CR>", { desc = "Run a project task" })
    vim.keymap.set("n", ",q", "<cmd>OverseerQuickAction<CR>", { desc = "Overseer Quick Action" })
  end,
}
