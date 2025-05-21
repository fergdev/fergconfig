vim.keymap.set("n", "<leader>sc", function()
  local Snacks = require("snacks")
  local colors = vim.fn.getcompletion("", "color")

  Snacks.picker({
    finder = function()
      local items = {}
      for i, name in ipairs(colors) do
        table.insert(items, {
          idx = i,
          name = name,
          text = name,
        })
      end
      return items
    end,

    layout = {
      layout = {
        box = "horizontal",
        width = 0.5,
        height = 0.5,
        {
          box = "vertical",
          border = "rounded",
          title = "🎨 Colorschemes",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
      },
    },

    format = function(item, _)
      return {
        { " ", "Identifier" },
        { item.name, "Normal" },
      }
    end,

    highlight = function(item)
      print("hi")
      vim.cmd.colorscheme(item.name)
    end,

    confirm = function(picker, item)
      picker:close()
      vim.cmd.colorscheme(item.name)
      vim.notify("🌈 Set colorscheme to: " .. item.name, vim.log.levels.INFO)
    end,
  })
end, { desc = "Snacks: Pick colorscheme" })

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, _)
        hl.Comment = { fg = "#808080" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
      vim.api.nvim_set_hl(0, "CopilotSuggestion", {
        fg = "#808080",
        ctermfg = 8,
        force = true,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
