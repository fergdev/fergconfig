-- vim.api.nvim_create_autocmd({ "cursorhold", "cursorholdi" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, {
--       focus = false,
--       border = "rounded",
--     })
--   end,
-- })
--
--
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.zsh", ".zshrc", ".zshenv", ".zprofile" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})
