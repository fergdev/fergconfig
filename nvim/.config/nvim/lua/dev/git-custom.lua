local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local function git_reflog_picker()
  pickers
    .new({}, {
      prompt_title = "Git Reflog Branches",
      finder = finders.new_oneshot_job({ "git", "reflog", "--pretty=%gD %gs" }, {}),
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

local function diff_with_branch()
  -- Get list of branches
  local handle = io.popen('git branch --all --format="%(refname:short)"')
  if handle == nil then
    vim.notify("Error: Unable to get branches")
    return
  end
  local result = handle:read("*a")
  handle:close()
  local branches = {}
  for branch in result:gmatch("[^\r\n]+") do
    table.insert(branches, branch)
  end

  pickers
    .new({ selection_strategy = "reset" }, {
      prompt_title = "Select branch to diff against",
      finder = finders.new_table({ results = branches }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("DiffviewOpen " .. selection[1])
        end)
        return true
      end,
    })
    :find()
end

local function diff_with_log()
  -- Get list of branches
  local handle = io.popen("git log --oneline")
  if handle == nil then
    vim.notify("Error: Unable to get log")
    return
  end
  local result = handle:read("*a")
  handle:close()
  local branches = {}
  for branch in result:gmatch("[^\r\n]+") do
    table.insert(branches, branch)
  end

  pickers
    .new({}, {
      prompt_title = "Select commit to diff against",
      finder = finders.new_table({ results = branches }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("DiffviewOpen " .. selection[1])
        end)
        return true
      end,
    })
    :find()
end

return {
  git_reflog_picker = git_reflog_picker,
  diff_with_branch = diff_with_branch,
  diff_with_log = diff_with_log,
}
