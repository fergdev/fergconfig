local M = {}
local terminals = {}

local log_level = vim.log.levels.TRACE

local log = function(...)
  local msg = table.concat(vim.tbl_map(tostring, { ... }), " ")
  -- print(msg)
  vim.notify(msg, log_level, { title = "Harpoon" })
end

local function create_terminal(create_with)
  if not create_with then
    create_with = ":terminal"
  end
  log("term: _create_terminal(): Init:", create_with)
  local current_id = vim.api.nvim_get_current_buf()

  vim.cmd(create_with)
  local buf_id = vim.api.nvim_get_current_buf()
  local term_id = vim.b.terminal_job_id

  if term_id == nil then
    log("_create_terminal(): term_id is nil")
    -- TODO: Throw an error?
    return nil
  end

  -- Make sure the term buffer has "hidden" set so it doesn't get thrown
  -- away and cause an error
  vim.api.nvim_buf_set_option(buf_id, "bufhidden", "hide")

  -- Resets the buffer back to the old one
  vim.api.nvim_set_current_buf(current_id)
  return buf_id, term_id
end

local function find_terminal(args)
  log("term: _find_terminal(): Terminal:", args)
  if type(args) == "number" then
    args = { idx = args }
  end
  local term_handle = terminals[args.idx]
  if not term_handle or not vim.api.nvim_buf_is_valid(term_handle.buf_id) then
    local buf_id, term_id = create_terminal(args.create_with)
    if buf_id == nil then
      error("Failed to find and create terminal.")
      return
    end

    term_handle = {
      buf_id = buf_id,
      term_id = term_id,
    }
    terminals[args.idx] = term_handle
  end
  return term_handle
end

function M.gotoTerminal(idx)
  log("term: gotoTerminal(): Terminal:", idx)
  local term_handle = find_terminal(idx)
  if term_handle == nil then
    log("gotoTerminal(): No terminal found for index", idx)
    return
  end

  vim.api.nvim_set_current_buf(term_handle.buf_id)
end

function M.sendCommand(idx, cmd, ...)
  log("term: sendCommand(): Terminal:", idx)
  local term_handle = find_terminal(idx)

  if term_handle == nil then
    log("sendCommand(): No terminal found for index", idx)
    return
  end

  cmd = cmd .. "\n"

  if cmd then
    log("sendCommand:", cmd)
    vim.api.nvim_chan_send(term_handle.term_id, string.format(cmd, ...))
  end
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      cmd = {
        select = function(list_item, list, option)
          log("harpoon:select(): list_item:", list_item, "list:", list, "option:", option)
          local idx = list_item.context.row
          if option.run then
            M.sendCommand(idx, list_item.value)
          end
          M.gotoTerminal(idx)
        end,
      },
    })

    vim.keymap.set("n", "<leader>h", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>H", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set("n", "]y", function()
      harpoon:list():next({ ui_nav_wrap = true })
    end)
    vim.keymap.set("n", "[y", function()
      harpoon:list():prev({ ui_nav_wrap = true })
    end)

    vim.keymap.set("n", "<leader>C", function()
      harpoon.ui:toggle_quick_menu(harpoon:list("cmd"))
    end)

    for i = 1, 4 do
      vim.keymap.set("n", "<leader>[" .. i, function()
        harpoon:list("cmd"):select(1, { run = true })
      end)
    end
    for i = 1, 4 do
      vim.keymap.set("n", "<leader>]" .. i, function()
        harpoon:list("cmd"):select(1, { run = false })
      end)
    end
  end,
}
