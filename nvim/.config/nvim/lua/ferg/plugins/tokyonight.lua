-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
--     opts = {
--         style = "storm",
-- 		styles = {
-- 			comments = { italic = true },
-- 			keywords = { italic = true },
-- 			functions = {},
-- 			variables = {},
-- 			-- sidebars = "dark", -- style for sidebars, see below
-- 			-- floats = "dark", -- style for floating windows
-- 		},
-- 		on_highlights = function(hl, _)
-- 			hl.comment = { fg = "#808080" }
-- 			hl.Comment = { fg = "#808080" }
-- 			hl.hint = { fg = "#808080" }
-- 		end,
--     },
--     config = function(_, opts)
--         require("tokyonight").setup(opts)
--         vim.cmd("colorscheme tokyonight")
-- 		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
-- 			fg = "#808080",
-- 			ctermfg = 8,
-- 			force = true,
-- 		})
--     end
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
    opts = {
        style = "storm",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
		},
		on_highlights = function(hl, _)
			hl.Comment = { fg = "#808080" }
		end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#808080",
			ctermfg = 8,
			force = true,
		})
    end
}
