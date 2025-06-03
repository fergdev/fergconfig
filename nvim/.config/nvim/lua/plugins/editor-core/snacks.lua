local function set_normal_float_highlight()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_normal_float_highlight,
})
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 5000,
      top_down = false,
    },
    layouts = {
      ivy = {
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.5,
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "left",
          { win = "input", height = 1, border = "bottom" },
          {
            box = "horizontal",
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", width = 0.5, border = "left" },
          },
        },
      },
      -- I wanted to modify the layout width
      --
      vertical = {
        layout = {
          backdrop = false,
          width = 0.8,
          min_width = 80,
          height = 0.8,
          min_height = 30,
          box = "vertical",
          border = "rounded",
          title = "{title} {live} {flags}",
          title_pos = "center",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
          { win = "preview", title = "{preview}", height = 0.4, border = "top" },
        },
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },
      layout = {
        preset = "ivy",
        cycle = false,
      },
      debug = {
        scores = false,
      },
      matcher = {
        frecency = true,
      },
    },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
    win = {
      config = {
        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual",
      },
    },
  },
  keys = {
    -- {
    --   "<leader>sf",
    --   function()
    --     Snacks.picker.files()
    --   end,
    --   desc = "Find Files",
    -- },
    {
      "<leader>sf",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    -- {
    --   "<leader>e",
    --   function()
    --     Snacks.explorer()
    --   end,
    --   desc = "File Explorer",
    -- },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    -- {
    --   "<leader>fp",
    --   function()
    --     Snacks.picker.projects()
    --   end,
    --   desc = "Projects",
    -- },
    {
      "<leader>sr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gq",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    -- Grep
    {
      "<leader>/",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    -- {
    --   "<leader>sl",
    --   function()
    --     Snacks.picker.loclist()
    --   end,
    --   desc = "Location List",
    -- },
    -- {
    --   "<leader>sm",
    --   function()
    --     Snacks.picker.marks()
    --   end,
    --   desc = "Marks",
    -- },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>in",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    -- {
    --   "<leader>cR",
    --   function()
    --     Snacks.rename.rename_file()
    --   end,
    --   desc = "Rename File",
    -- },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>tt",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      -- -- You can confirm in your teminal lamw26wmal with:
      -- -- rg "^\s*-\s\[ \]" test-markdown.md
      "<leader>nst",
      function()
        Snacks.picker.grep({
          prompt = " ",
          -- pass your desired search as a static pattern
          search = "^\\s*- \\[ \\]",
          -- we enable regex so the pattern is interpreted as a regex
          regex = true,
          -- no “live grep” needed here since we have a fixed pattern
          live = false,
          -- restrict search to the current working directory
          dirs = { vim.fn.getcwd() },
          -- include files ignored by .gitignore
          args = { "--no-ignore" },
          -- Start in normal mode
          on_show = function()
            vim.cmd.stopinsert()
          end,
          finder = "grep",
          format = "file",
          show_empty = true,
          supports_live = false,
          layout = "ivy",
        })
      end,
      desc = "[P]Search for incomplete tasks",
    },
    -- -- Iterate throuth completed tasks in Snacks_picker lamw26wmal
    {
      "<leader>tc",
      function()
        Snacks.picker.grep({
          prompt = " ",
          -- pass your desired search as a static pattern
          -- search = "^\\s*- \\[x\\] `done:",
          search = "^\\s*- \\[x\\]",
          -- we enable regex so the pattern is interpreted as a regex
          regex = true,
          -- no “live grep” needed here since we have a fixed pattern
          live = false,
          -- restrict search to the current working directory
          dirs = { vim.fn.getcwd() },
          -- include files ignored by .gitignore
          args = { "--no-ignore" },
          -- Start in normal mode
          on_show = function()
            vim.cmd.stopinsert()
          end,
          finder = "grep",
          format = "file",
          show_empty = true,
          supports_live = false,
          layout = "ivy",
        })
      end,
      desc = "[P]Search for complete tasks",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")

        vim.keymap.set("n", "<leader>sl", function()
          local dir = "~/.local/share/nvim/"
          Snacks.picker({
            layout = "vertical",
            finder = function()
              local files = vim.fn.glob(vim.fn.expand(dir) .. "/**/*", false, true)
              local items = {}

              for i, file in ipairs(files) do
                if vim.fn.filereadable(file) == 1 then
                  table.insert(items, {
                    idx = i,
                    file = file,
                    text = vim.fn.fnamemodify(file, ":~:."),
                  })
                end
              end

              return items
            end,
            format = function(item)
              return { { item.text } }
            end,
            confirm = function(picker, item)
              picker:close()
              vim.cmd("edit " .. item.file)
            end,
          })
        end, { desc = "[S]earch [N]vim dir" })
      end,
    })
  end,
}
