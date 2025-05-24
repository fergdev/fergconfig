vim.keymap.set("n", "<leader>rr", function()
  local ft = vim.bo.filetype
  local cmd = {
    lua = "lua",
    python = "python3",
    javascript = "node",
    sh = "bash",
  }

  local runner = cmd[ft]
  if not runner then
    vim.notify("No runner for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local tmpfile = vim.fn.tempname()
  vim.fn.writefile(lines, tmpfile)

  -- Create a new readonly scratch buffer for output
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "modifiable", true)

  vim.cmd("botright split")
  vim.api.nvim_win_set_buf(0, buf)

  -- Start the background job and stream output into the buffer
  vim.fn.jobstart(runner .. " " .. tmpfile, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
        end)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
        end)
      end
    end,
    on_exit = function(_, code)
      vim.schedule(function()
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
          "",
          "--- process exited with code " .. code .. " ---",
        })
      end)
    end,
  })
end, { desc = "Run buffer with jobstart and capture output" })
