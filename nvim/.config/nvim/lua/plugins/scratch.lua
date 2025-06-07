return {
  "LintaoAmons/scratch.nvim",
  event = "VeryLazy",
  dependencies = {
    { "ibhagwan/fzf-lua" }, --optional: if you want to use fzf-lua to pick scratch file. Recommanded, since it will order the files by modification datetime desc. (require rg)
    { "nvim-telescope/telescope.nvim" }, -- optional: if you want to pick scratch file by telescope
  },
  config = function()
    require("scratch").setup({
      scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim", -- where your scratch files will be put
      window_cmd = "rightbelow vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
      use_telescope = true,
      file_picker = "fzflua", -- "fzflua" | "telescope" | nil
      filetypes = { "json", "xml", "yaml", "lua", "sh", "py", "http", "text", "js", "log" }, -- you can simply put filetype here
      filetype_details = { -- or, you can have more control here
        json = {}, -- empty table is fine
        ["project-name.md"] = {
          subdir = "project-name", -- group scratch files under specific sub folder
        },
        ["yaml"] = {},
        go = {
          requireDir = true, -- true if each scratch file requires a new directory
          filename = "main", -- the filename of the scratch file in the new directory
          content = { "package main", "", "func main() {", "  ", "}" },
          cursor = {
            location = { 4, 2 },
            insert_mode = true,
          },
        },
      },
      localKeys = {
        {
          filenameContains = { "sh" },
          LocalKeys = {
            {
              cmd = "<CMD>RunShellCurrentLine<CR>",
              key = "<C-r>",
              modes = { "n", "i", "v" },
            },
          },
        },
      },
      hooks = {
        {
          callback = function(opts)
            -- vim.api.nvim_buf_set_lines(0, 0, -1, false, { "hello", "world" })
            -- TODO figure out how to set the run command here
            print(opts)
          end,
        },
      },
    })
  end,
}
