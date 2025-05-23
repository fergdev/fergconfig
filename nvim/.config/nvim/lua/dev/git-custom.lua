local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local function git_reflog_picker()
  pickers
    .new({}, {
      prompt_title = "Git Reflog Branches",
      finder = finders.new_oneshot_job({ "git", "reflog", "--pretty=%gD %gs" }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          local ref = entry[1]:match("^(.-) ") or entry[1]
          vim.cmd("Git checkout " .. ref)
        end)
        return true
      end,
    })
    :find()
end

return {
  git_reflog_picker = git_reflog_picker,
}
