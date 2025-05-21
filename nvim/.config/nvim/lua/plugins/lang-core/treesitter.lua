return {
	"nvim-treesitter/nvim-treesitter",
	build = ":tsupdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"make",
				"vim",
				"http",
				-- "rust",
				"java",
				"kotlin",
				"vimdoc",
			},
            auto_install = true,
            ignore_install = {},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
            modules = {},
		})
	end,
}
