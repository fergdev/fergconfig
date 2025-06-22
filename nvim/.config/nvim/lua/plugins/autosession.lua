return {
  "rmagatti/auto-session",
  lazy = false,
  enabled = true,
  priority = 1000,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_save = true,
    auto_restore = true,
    close_unsupported_windows = true,
    bypass_save_filetypes = { "alpha", "copilot-chat" },
    session_lens = {
      previewer = false, -- File preview for session picker
    },
  },
}
