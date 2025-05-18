vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>ee", vim.cmd.Ex)
keymap.set("n", "<leader>p", '"*p')
keymap.set({ "n", "v" }, "<leader>y", '"*y')

keymap.set("n", "<leader>sh", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<leader>sl", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<leader>sj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<leader>sk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
keymap.set("n", "<leader>sv", vim.cmd.vsplit, { desc = "Split vertical" })
keymap.set("n", "<leader>ss", vim.cmd.split, { desc = "Split horizontal" })
keymap.set("n", "<leader>su", vim.cmd.close, { desc = "Close current window" })

keymap.set("n", "<C-k>", ":resize +2<CR>")
keymap.set("n", "<C-j>", ":resize -2<CR>")
keymap.set("n", "<C-l>", ":vertical resize -2<CR>")
keymap.set("n", "<C-h>", ":vertical resize +2<CR>")

keymap.set("n", "]e", vim.diagnostic.goto_next)
keymap.set("n", "[e", vim.diagnostic.goto_prev)

keymap.set("n", "]b", vim.cmd.bp)
keymap.set("n", "[b", vim.cmd.bn)

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "\\c", ":e ~/.dotfiles/cheatsheet.md<CR>")
keymap.set("n", "<leader>wt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error under cursor" })

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})
