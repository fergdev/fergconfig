-- Keymaps - tracking info
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
-- r - run
-- d - debug
--
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>p", '"*p')
keymap.set({ "n", "v" }, "<leader>y", '"*y')

-- Windows
keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
keymap.set("n", "<leader>wo", ":only<CR>", { desc = "[W]indow [O]nly this" })
keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "Split vertical" })
keymap.set("n", "<leader>ws", vim.cmd.split, { desc = "Split horizontal" })
keymap.set("n", "<leader>wx", vim.cmd.close, { desc = "Close current window" })

keymap.set("n", "<C-k>", ":resize +2<CR>")
keymap.set("n", "<C-j>", ":resize -2<CR>")
keymap.set("n", "<C-l>", ":vertical resize -2<CR>")
keymap.set("n", "<C-h>", ":vertical resize +2<CR>")

vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "[t", ":tabprevious<CR>", { desc = "Prev Tab" })

keymap.set("n", "]b", vim.cmd.bp)
keymap.set("n", "[b", vim.cmd.bn)

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "\\c", ":e ~/.dotfiles/cheatsheet.md<CR>")

vim.keymap.set("n", "<leader><leader>s", ":so %<CR>", { desc = "Source current file" })

-- LSP
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.code_action, { desc = "[R]efactor [A]ctions" })
vim.keymap.set("n", "<leader>ri", ":LspInfo<CR>", { desc = "[L]sp [I]nfo" })
vim.keymap.set("n", "<leader>rl", ":LspLog<CR>", { desc = "[L]sp [L]og" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })

-- Ai
vim.keymap.set("n", "<leader>ac", ":CopilotChatToggle<CR>", { desc = "Go to definition" })

-- Strings
vim.keymap.set("v", "<leader>be", [[:'<,'>!base64<CR>]], { desc = "[B]ase64 [E]ncode selection" })
vim.keymap.set("v", "<leader>bd", [[:'<,'>!base64 -d<CR>]], { desc = "[B]ase64 [D]ecode selection" })

vim.api.nvim_create_user_command("MessagesBuffer", function()
	vim.cmd("redir @a | messages | redir END | new | put a")
end, {})

vim.keymap.set("n", "<leader>vm", "<cmd>MessagesBuffer<CR>", { desc = "[V]iew [m]esaages in buffer" })

vim.keymap.set("n", "<leader>gr", function()
	require("config.dev.git_custom").git_reflog_picker()
end, { desc = "Git reflog branches" })

vim.keymap.set(
	"n",
	"<leader>tk",
	'<cmd>lua require("kubectl").toggle({ tab = boolean })<cr>',
	{ desc = "KubeTime", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>tn", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<leader>to", "<cmd>ScratchOpen<cr>")


-- Running things
vim.keymap.set("n", "<leader>,ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>,tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
  require("neotest").output.open({ enter = true })
end, { desc = "Run file tests and show output" })

vim.keymap.set("n", "<leader>,tn", function()
  require("neotest").run.run()
  require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Run nearest test and show output" })


vim.keymap.set("n", ",o", function()
	vim.api.nvim_set_keymap("n", ",o", ":OverseerToggle<CR>", { noremap = true, silent = true })
end, { desc = "Run a project task" })

