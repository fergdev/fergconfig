-- if true then
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "harper_ls",
        "ts_ls",
        "docker_compose_language_service",
        "dockerls",
        "protols",
        "helm_ls",
        "lua_ls",
        "lemminx",
        "bashls",
        "jsonls",
        "yamlls",
        "postgres_lsp",
        "taplo",
        -- "jdtls",
      },
    },
    dependencies = {
      {
        "nvim-java/nvim-java",
        dependencies = {
          {
            "neovim/nvim-lspconfig",
            opts = {
              servers = {
                jdtls = {
                  settings = {
                    java = {
                      configuration = {
                        runtimes = {
                          {
                            name = "JavaSE-21",
                            path = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home",
                          },
                        },
                      },
                    },
                  },
                },
              },
              setup = {
                jdtls = function()
                  require("java").setup({
                    jdk = {
                      auto_install = false,
                    },
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
        { "mason-org/mason.nvim", opts = {} },
      },
      -- {
      --   "neovim/nvim-lspconfig",
      --   opts = {
      --     servers = {
      --       -- Your JDTLS configuration goes here
      --       jdtls = {
      --         settings = {
      --           java = {
      --             configuration = {
      --               runtimes = {
      --                 {
      --                   name = "JavaSE-17",
      --                   path = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
      --                 },
      --               },
      --             },
      --           },
      --         },
      --       },
      --     },
      --     setup = {
      --       jdtls = function()
      --         -- Your nvim-java configuration goes here
      --         require("java").setup({
      --           root_markers = {
      --             "settings.gradle",
      --             "settings.gradle.kts",
      --             "pom.xml",
      --             "build.gradle",
      --             "mvnw",
      --             "gradlew",
      --             "build.gradle",
      --             "build.gradle.kts",
      --           },
      --         })
      --       end,
      --     },
      --   },
      -- },
    },
  },
}
-- else
--   return {
--
--     {
--       "neovim/nvim-lspconfig",
--       dependencies = {
--         "nvim-java/nvim-java",
--         "stevearc/conform.nvim",
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         -- {
--         --   "j-hui/fidget.nvim",
--         --   opts = {
--         --     notification = {
--         --       window = {
--         --         winblend = 0,
--         --       },
--         --     },
--         --   },
--         -- },
--       },
--       opts = {
--         servers = {
--           -- Your JDTLS configuration goes here
--           jdtls = {
--             settings = {
--               java = {
--                 configuration = {
--                   runtimes = {
--                     {
--                       name = "JavaSE-17",
--                       path = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
--                     },
--                   },
--                 },
--               },
--             },
--           },
--         },
--         setup = {
--           jdtls = function()
--             -- Your nvim-java configuration goes here
--             require("java").setup({
--               root_markers = {
--                 "settings.gradle",
--                 "settings.gradle.kts",
--                 "pom.xml",
--                 "build.gradle",
--                 "mvnw",
--                 "gradlew",
--                 "build.gradle",
--                 "build.gradle.kts",
--               },
--             })
--           end,
--         },
--       },
--
--       config = function(_, opts)
--         require("conform").setup({
--           formatters_by_ft = {},
--         })
--
--         require("mason").setup()
--         require("mason-lspconfig").setup({
--           automatic_enable = true,
--           ensure_installed = {
--             "harper_ls",
--             "ts_ls",
--             "docker_compose_language_service",
--             "dockerls",
--             "protols",
--             "helm_ls",
--             "lua_ls",
--             "lemminx",
--             "bashls",
--             "jsonls",
--             "yamlls",
--             "postgres_lsp",
--             "taplo",
--           },
--         })
--
--         vim.diagnostic.config({
--           virtual_text = true,
--           signs = true,
--           underline = true,
--           update_in_insert = true,
--           severity_sort = true,
--           float = {
--             focusable = false,
--             style = "minimal",
--             border = "rounded",
--             source = true,
--             header = "",
--             prefix = "",
--           },
--         })
--         local hover = vim.lsp.buf.hover
--         ---@diagnostic disable-next-line: duplicate-set-field
--         vim.lsp.buf.hover = function()
--           return hover({
--             max_width = 100,
--             max_height = 14,
--             border = "rounded",
--           })
--         end
--       end,
--     },
--   }
-- end
