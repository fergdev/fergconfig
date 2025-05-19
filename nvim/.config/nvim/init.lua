require("ferg")

local project_config = vim.fn.getcwd() .. "/.nvim.lua"
if vim.fn.filereadable(project_config) == 1 then
  vim.cmd("luafile " .. project_config)
end
