return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,
			numhl = true,
			linehl = true,
			word_diff = true,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 300,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			max_file_length = 40000,
			preview_config = {
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation durch Git-Hunks
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Aktionen für Hunks
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
		config = function()
			local highlights = {
				{ group = "GitSignsAdd", link = "DiffAdd" },
				{ group = "GitSignsAddNr", link = "DiffAdd" },
				{ group = "GitSignsAddLn", link = "DiffAdd" },
				{ group = "GitSignsChange", link = "DiffChange" },
				{ group = "GitSignsChangeNr", link = "DiffChange" },
				{ group = "GitSignsChangeLn", link = "DiffChange" },
				{ group = "GitSignsDelete", link = "DiffDelete" },
				{ group = "GitSignsDeleteNr", link = "DiffDelete" },
				{ group = "GitSignsDeleteLn", link = "DiffDelete" },
				{ group = "GitSignsTopdelete", link = "DiffDelete" },
				{ group = "GitSignsTopdeleteNr", link = "DiffDelete" },
				{ group = "GitSignsTopdeleteLn", link = "DiffDelete" },
				{ group = "GitSignsChangedelete", link = "DiffChange" },
				{ group = "GitSignsChangedeleteNr", link = "DiffChange" },
				{ group = "GitSignsChangedeleteLn", link = "DiffChange" },
				{ group = "GitSignsUntracked", link = "DiffAdd" },
				{ group = "GitSignsUntrackedNr", link = "DiffAdd" },
				{ group = "GitSignsUntrackedLn", link = "DiffAdd" },
			}

			for _, hl in ipairs(highlights) do
				vim.api.nvim_set_hl(0, hl.group, { link = hl.link })
			end
		end,
	},
}
