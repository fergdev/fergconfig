vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>p", '"*p')
keymap.set({ "n", "v" }, "<leader>y", '"*y')

keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "Split vertical" })
keymap.set("n", "<leader>ws", vim.cmd.split, { desc = "Split horizontal" })
keymap.set("n", "<leader>wx", vim.cmd.close, { desc = "Close current window" })

keymap.set("n", "<C-k>", ":resize +2<CR>")
keymap.set("n", "<C-j>", ":resize -2<CR>")
keymap.set("n", "<C-l>", ":vertical resize -2<CR>")
keymap.set("n", "<C-h>", ":vertical resize +2<CR>")

keymap.set("n", "]b", vim.cmd.bp)
keymap.set("n", "[b", vim.cmd.bn)

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "\\c", ":e ~/.dotfiles/cheatsheet.md<CR>")

vim.keymap.set("n", "<leader><leader>s", ":so %<CR>", { desc = "Source current file" })

-- LSP
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { desc = "[L]sp [I]nfo" })
vim.keymap.set("n", "<leader>ll", ":LspLog<CR>", { desc = "[L]sp [L]og" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "<leader>ac", ":CopilotChatToggle<CR>", { desc = "Go to definition" })

vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

vim.keymap.set("v", "<leader>be", [[:'<,'>!base64<CR>]], { desc = "[B]ase64 [E]ncode selection" })
vim.keymap.set("v", "<leader>bd", [[:'<,'>!base64 -d<CR>]], { desc = "[B]ase64 [D]ecode selection" })

vim.api.nvim_create_user_command("MessagesBuffer", function()
	vim.cmd("redir @a | messages | redir END | new | put a")
end, {})

vim.keymap.set("n", "<leader>vm", "<cmd>MessagesBuffer<CR>", { desc = "[V]iew [m]esaages in buffer" })

vim.keymap.set("n", "<leader>bs", function()
	require("config.dev.git_custom").git_reflog_picker()
end, { desc = "Git reflog branches" })

vim.keymap.set(
	"n",
	"<leader>k",
	'<cmd>lua require("kubectl").toggle({ tab = boolean })<cr>',
	{ desc = "KubeTime", noremap = true, silent = true }
)

vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")

