local logcat_buf = nil
local logcat_win = nil
local logcat_job = -1

function OpenLogcatBuffer()
  if logcat_buf and vim.api.nvim_buf_is_valid(logcat_buf) then
    if logcat_job >= 0 then
      vim.fn.jobstop(logcat_job)
      logcat_job = -1
    end
    vim.api.nvim_buf_delete(logcat_buf, { force = true })
    logcat_buf = nil
    logcat_win = nil
    return
  end

  -- Create a new vertical split and buffer
  vim.cmd("vsplit")
  logcat_win = vim.api.nvim_get_current_win()
  logcat_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(logcat_win, logcat_buf)

  vim.bo[logcat_buf].buftype = "nofile"
  vim.bo[logcat_buf].bufhidden = "hide"
  vim.bo[logcat_buf].swapfile = false

  -- Start logcat job
  local job_id = vim.fn.jobstart({ "adb", "logcat" }, {
    stdout_buffered = false,
    on_stdout = function(_, data, _)
      if data and logcat_job ~= -1 then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(logcat_buf, -1, -1, false, data)
        end)
      end
    end,
    on_stderr = function(_, err_data, _)
      if err_data and logcat_job ~= -1 then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(logcat_buf, -1, -1, false, err_data)
        end)
      end
    end,
    on_exit = function()
      print("Logcat job exited")
      if logcat_job ~= -1 then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(logcat_buf, -1, -1, false, { "-- logcat ended --" })
        end)
      end
    end,
  })

  if job_id <= 0 then
    vim.api.nvim_buf_set_lines(logcat_buf, 0, -1, false, { "Failed to start adb logcat" })
  else
    logcat_job = job_id
  end
end

vim.keymap.set("n", "<leader>lc", OpenLogcatBuffer, { desc = "Toggle Logcat Window" })
