return {
	"mrcjkb/rustaceanvim",
	lazy = false,
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	dap = {
		enabled = true,
		setup = function()
			require("rustaceanvim.dap").setup()
		end,
	},
}
