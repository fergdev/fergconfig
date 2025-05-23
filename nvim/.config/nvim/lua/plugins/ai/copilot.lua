local enabled = true
return {
  {
    "zbirenbaum/copilot.lua",
    enabled = enabled,
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = true, -- handled by nvim-cmp / blink.cmp
          next = "<C-o>",
          prev = "<C-i>",
        },
      },
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<leader>ai",
        },
        layout = {
          position = "right", -- | top | left | right | horizontal | vertical
          ratio = 0.3,
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = enabled,
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      show_diff = {
        full_diff = true,
      },
    },
  },
}
