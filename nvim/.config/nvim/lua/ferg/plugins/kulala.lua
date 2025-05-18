return {
	-- "mistweaverco/kulala.nvim",
	-- ft = { "http" },
	-- opts = {
	-- 	global_keymaps = false,
	-- },
	-- keys = {
	-- 	{
	-- 		"<leader>Rs",
	-- 		function()
	-- 			require("kulala").send_request()
	-- 		end,
	-- 		desc = "Send request under cursor",
	-- 	},
	-- 	{
	-- 		"<leader>Rb",
	-- 		function()
	-- 			require("kulala").open_scratchpad()
	-- 		end,
	-- 		desc = "Open scratchpad",
	-- 	},
	-- },
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>Rs", desc = "Send request" },
		{ "<leader>Ra", desc = "Send all requests" },
		{ "<leader>Rb", desc = "Open scratchpad" },
	},
	ft = { "http" },
	opts = {
		-- your configuration comes here
		global_keymaps = true,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
	},
}
