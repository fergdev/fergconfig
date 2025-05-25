function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  mappings = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    -- {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   -- install the latest stable version
    --   version = "*",
    --   config = function()
    --     require("telescope").load_extension "frecency"
    --   end,
    -- }
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-[>"] = actions.close,

          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },

        n = {
          ["<C-[>"] = actions.close,

          ["<CR>"] = actions.select_default,

          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["?"] = actions.which_key,
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")

    local grep_string = function()
      builtin.grep_string({
        additional_args = function()
          return { "--hidden", "--glob", "!.git/*" }
        end,
        previewer = false,
      })
    end

    local live_grep = function(opts)
      local m_opts = vim.tbl_deep_extend("force", opts, {
        additional_args = function()
          return { "--hidden", "--glob", "!.git/*" }
        end,
      })
      builtin.live_grep(m_opts)
    end

    vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope" })
    vim.keymap.set("n", "<leader>fw", grep_string, { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fg", function()
      live_grep({})
    end, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files aka old" })
    vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "[F]ind [L]ast aka resume" })

    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[F]ind [/] in Open Files" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[F]ind [N]eovim files" })

    local keymap = vim.keymap.set

    keymap("v", "<space>fg", function()
      local text = vim.getVisualSelection()
      print("Selected text: " .. text)
      live_grep({ default_text = text })
    end, { noremap = true, silent = true })
  end,
}
