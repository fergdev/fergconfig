-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---- Keymaps - tracking info
--
-- g {go}
--
-- <leader>
--
-- g - git
-- r - refactor
-- s - search
-- t - tools
-- w - window
-- , {run}
-- - r - run
-- - d - debug
--
-- n - notes

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- Unset
vim.keymap.del("n", "<leader>gd")

-- Windows
keymap.set("n", "<leader>%", vim.cmd.vsplit, { desc = "Split vertical" })
keymap.set("n", '<leader>"', vim.cmd.split, { desc = "Split horizontal" })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]], { desc = "make the window biger vertically" })
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]], { desc = "make the window smaller vertically" })
vim.keymap.set(
  "n",
  "+",
  [[<cmd>horizontal resize +2<cr>]],
  { desc = "make the window bigger horizontally by pressing shift and " }
)
vim.keymap.set(
  "n",
  "_",
  [[<cmd>horizontal resize -2<cr>]],
  { desc = "make the window smaller horizontally by pressing shift and " }
)

vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "[t", ":tabprevious<CR>", { desc = "Prev Tab" })

keymap.set("n", "]b", vim.cmd.bp)
keymap.set("n", "[b", vim.cmd.bn)

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "\\c", ":e ~/.dotfiles/cheatsheet.md<CR>")

vim.keymap.set("n", "<leader><leader>s", ":so %<CR>", { desc = "Source current file" })

-- LSP
vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>vrn", function()
  -- requiring it to make sure inc_rename is loaded

  local ok, _ = pcall(require, "inc_rename")
  if ok then
    return ":IncRename " .. vim.fn.expand("<cword>")
  end
end, { expr = true, silent = false, desc = "Rename" })

vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Refactor [A]ctions" })
vim.keymap.set("n", "<leader>ri", ":LspInfo<CR>", { desc = "[L]sp [I]nfo" })
vim.keymap.set("n", "<leader>rl", ":LspLog<CR>", { desc = "[L]sp [L]og" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "<leader>gcr", function()
  require("dev.git-custom").git_reflog_picker()
end, { desc = "Git checkout reflog" })

vim.keymap.set("n", "<leader>gdb", function()
  require("dev.git-custom").diff_with_branch()
end, { desc = "Git diff branch" })

vim.keymap.set("n", "<leader>gdl", function()
  require("dev.git-custom").diff_with_log()
end, { desc = "Git diff log" })

vim.keymap.set("n", "<leader>gdh", function()
  vim.cmd("DiffviewOpen")
end, { desc = "Git diff head" })

vim.keymap.set({ "n" }, "<leader>gdf", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "Git diff file history" })

vim.keymap.set("v", "<leader>gdf", function()
  vim.cmd("normal! gv") -- Reselect visual area
  vim.cmd("'<,'>DiffviewFileHistory")
end, { desc = "Git diff file history for selection" })

vim.keymap.set(
  "n",
  "<leader>ik",
  '<cmd>lua require("kubectl").toggle({ tab = boolean })<cr>',
  { desc = "KubeTime", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>in", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<leader>io", "<cmd>ScratchOpen<cr>")

-- Running things
vim.keymap.set("n", ",ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })

vim.keymap.set("n", ",tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
  require("neotest").output.open({ enter = true })
end, { desc = "Run file tests and show output" })

vim.keymap.set("n", ",tn", function()
  require("neotest").run.run()
  require("neotest").output.open({ enter = true, auto_close = false })
end, { desc = "Run nearest test and show output" })

vim.keymap.set("n", ",to", function()
  require("neotest").output.open({ enter = true, auto_close = false })
end, { desc = "Show test output" })

vim.keymap.set("n", "<leader>nd", ":ObsidianToday<cr>", { desc = "obsidian [d]aily" })
vim.keymap.set("n", "<leader>nt", ":ObsidianToday 1<cr>", { desc = "obsidian [t]omorrow" })
vim.keymap.set("n", "<leader>ny", ":ObsidianToday -1<cr>", { desc = "obsidian [y]esterday" })
vim.keymap.set("n", "<leader>nb", ":ObsidianBacklinks<cr>", { desc = "obsidian [b]acklinks" })
vim.keymap.set("n", "<leader>nl", ":ObsidianLink<cr>", { desc = "obsidian [l]ink selection" })
vim.keymap.set("n", "<leader>nf", ":ObsidianFollowLink<cr>", { desc = "obsidian [f]ollow link" })
vim.keymap.set("n", "<leader>nn", ":ObsidianNew<cr>", { desc = "obsidian [n]ew" })
vim.keymap.set("n", "<leader>ns", ":ObsidianSearch<cr>", { desc = "obsidian [s]earch" })
vim.keymap.set("n", "<leader>no", ":ObsidianQuickSwitch<cr>", { desc = "obsidian [o]pen quickswitch" })
vim.keymap.set("n", "<leader>nO", ":ObsidianOpen<cr>", { desc = "obsidian [O]pen in app" })

vim.keymap.set("n", "<leader>xl", ":g/^\\s*$/d<cr>", { desc = "[X]elete empty [l]ines" })

-- use gh to move to the beginning of the line in normal mode
-- use gl to move to the end of the line in normal mode
-- vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "[P]Go to the beginning line" })
-- vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "[P]go to the end of the line" })

-- When searching for stuff, search results show in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
