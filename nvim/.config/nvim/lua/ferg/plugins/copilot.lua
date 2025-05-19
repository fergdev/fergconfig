return {
	"zbirenbaum/copilot.lua",
    enabled = false,
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "BufReadPost",
	opts = {
		suggestion = {
			enabled = not vim.g.ai_cmp,
			auto_trigger = true,
			hide_during_completion = vim.g.ai_cmp,
			keymap = {
				accept = false, -- handled by nvim-cmp / blink.cmp
				next = "<C-o>",
				prev = "<C-i>",
			},
		},
		panel = {
			enabled = true,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<leader>ai",
			},
			layout = {
				position = "right", -- | top | left | right | horizontal | vertical
				ratio = 0.3,
			},
		},
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
