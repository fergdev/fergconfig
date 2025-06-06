return {
  {
    "ramilito/kubectl.nvim",
    opts = { logs = { prefix = false, timestamps = false, since = "5m" } },
    config = function(_, opts)
      require("kubectl").setup(opts)
    end,
  },
}
