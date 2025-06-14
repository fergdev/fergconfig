return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    config = function()
      vim.keymap.set({ "n", "v" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
    end,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  },
}
