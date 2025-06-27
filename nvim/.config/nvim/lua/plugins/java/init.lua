if true then
  return {}
end
return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            -- androidSupport = { enable = true },
            on_attach = function()
              vim.keymap.set("n", "<leader>rv", ":JavaRefactorExtractVariableAllOccurrence<CR>")
              vim.keymap.set("n", "<leader>rV", ":JavaRefactorExtractVariable<CR>")
              vim.keymap.set("n", "<leader>rc", ":JavaRefactorExtractConstant<CR>")
              vim.keymap.set("n", "<leader>rm", ":JavaRefactorExtractMethod<CR>")
              vim.keymap.set("n", "<leader>rf", ":JavaRefactorExtractField<CR>")
            end,
          },
        },
        setup = {
          jdtls = function()
            -- Your nvim-java configuration goes here
            require("java").setup({
              root_markers = {
                "settings.gradle",
                "settings.gradle.kts",
                "pom.xml",
                "build.gradle",
                "mvnw",
                "gradlew",
                "build.gradle",
                "build.gradle.kts",
              },
            })
          end,
        },
      },
    },
  },
}
