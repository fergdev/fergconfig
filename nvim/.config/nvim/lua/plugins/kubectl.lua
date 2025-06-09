return {
  {
    "ramilito/kubectl.nvim",
    -- this needs to be called so the keys work
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("kubectl").setup({})
    end,
  },
}
