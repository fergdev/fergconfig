return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/.vlt/personal",
      },
      {
        name = "work",
        path = "~/.vlt/work",
      },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    ui = {
      enable = false,
    },
  },

  ui = {
    enable = true, -- set to false to disable all additional syntax features
  },
}
