return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      enter_on_sendcmd = true,
    },
    global_settings = {
      enter_on_sendcmd = true,
      ignore_filetypes = { "harpoon", "" },
    },
    term = {
      encode = false,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>h",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>H",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "[h",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon Quick next",
      },
      {
        "]h",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon Quick prev",
      },
      {
        "<leader>C",
        function()
          require("harpoon.cmd-ui").toggle_quick_menu()
        end,
        desc = "Harpoon Cmd Menu",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>]" .. i,
        function()
          require("harpoon.term").gotoTerminal(i)
        end,
        desc = "Harpoon goto term",
      })
    end
    for i = 1, 5 do
      table.insert(keys, {
        "<leader>[" .. i,
        function()
          -- local term = require("harpoon.term").find_terminal(i)
          -- if not term then
          --   term.sendCommand(i, "\3")
          -- end
          require("harpoon.term").sendCommand(i, i)
          require("harpoon.term").gotoTerminal(i)
        end,
        desc = "Harpoon run " .. i,
      })
    end

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon.ui").nav_file(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
