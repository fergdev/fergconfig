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

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

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

vim.keymap.set("n", "<leader>lt", function()
	vim.ui.select({ "json", "xml" }, { prompt = "Set buffer vibes:" }, function(choice)
		if choice then
			vim.cmd("echo 'Vibing with " .. choice .. " ft'")
			vim.cmd("set filetype=" .. choice .. "")
		end
	end)
end, { desc = "Set buffer FT vibes" })

vim.keymap.set("n", "<leader><leader>s", ":so %<CR>", { desc = "Source current file" })

-- LSP
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { desc = "[L]sp [I]nfo" })
vim.keymap.set("n", "<leader>ll", ":LspLog<CR>", { desc = "[L]sp [L]og" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "<leader>ac", ":CopilotChatToggle<CR>", { desc = "Go to definition" })

vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "tokoyonight",
	-- group = ...,
	callback = function()
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#808080",
			ctermfg = 8,
			force = true,
		})
	end,
})

vim.keymap.set("v", "<leader>be", [[:'<,'>!base64<CR>]], { desc = "[B]ase64 [E]ncode selection" })
vim.keymap.set("v", "<leader>bd", [[:'<,'>!base64 -d<CR>]], { desc = "[B]ase64 [D]ecode selection" })

vim.api.nvim_create_user_command("MessagesBuffer", function()
	vim.cmd("redir @a | messages | redir END | new | put a")
end, {})

vim.keymap.set("n", "<leader>vm", "<cmd>MessagesBuffer<CR>", { desc = "[V]iew [m]esaages in buffer" })
