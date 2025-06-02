return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("neotest").setup({
      adapters = {
        require("rustaceanvim.neotest"),
      },
      -- consumers = {
      --   overseer = require("neotest.consumers.overseer"),
      -- },
      output = {
        enter = true,
        open_on_run = true,
        enabled = true,
      },
      diagnostic = {
        enabled = true,
        severity = 1,
      },
      status = {
        enabled = true,
        virtual_text = false,
        signs = true,
      },
    })

    vim.keymap.set("n", "<leader>tr", function()
      require("neotest").run.run({
        suite = false,
        testify = true,
      })
    end, { desc = "Debug: Running Nearest Test" })
  end,
}
