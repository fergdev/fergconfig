vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>ee", vim.cmd.Ex)
keymap.set("n", "<leader>p", '"*p')
keymap.set({ "n", "v" }, "<leader>y", '"*y')

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
keymap.set("n", "<C-v>", vim.cmd.vertical, { desc = "Split vertical" })
keymap.set("n", "<C-h>", vim.cmd.split, { desc = "Split horizontal" })

keymap.set("n", "]e", vim.diagnostic.goto_next)
keymap.set("n", "[e", vim.diagnostic.goto_prev)

keymap.set("n", "]b", vim.cmd.bp)
keymap.set("n", "[b", vim.cmd.bn)
