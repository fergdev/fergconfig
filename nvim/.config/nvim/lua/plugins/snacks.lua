return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { animate = { enabled = false } },
    bigfile = { enabled = false },
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
      },
    },
  },
}
