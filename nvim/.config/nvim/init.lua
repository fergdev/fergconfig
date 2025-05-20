require("ferg")

-- Load current project conf
local project_config = vim.fn.getcwd() .. "/.nvim.lua"
if vim.fn.filereadable(project_config) == 1 then
	vim.cmd("luafile " .. project_config)
end

require("nvim-dap-projects").search_project_config()
