vim.lsp.config["kotlin_lsp"] = {
  cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(9999)),
  single_file_support = true,
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
}

-- TODO: configure with lsp-config
return {
  -- "neovim/nvim-lspconfig",
  -- opts = {
  --   servers = {
  --     kotlin_lsp = {
  --       -- Connects to a running LSP server on 127.0.0.1:9999
  --       cmd = vim.lsp.rpc.connect("127.0.0.1", 9999),
  --       single_file_support = true,
  --       filetypes = { "kotlin" },
  --       root_dir = function(fname)
  --         return require("lspconfig.util").root_pattern("build.gradle", "build.gradle.kts", "pom.xml")(fname)
  --       end,
  --     },
  --   },
  -- },
}
