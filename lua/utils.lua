local M = {}

-- Close the current buffer while keeping the window layout intact
-- (replacement for nvchad.tabufline.close_buffer).
function M.close_buffer()
  local cur = vim.api.nvim_get_current_buf()

  if vim.bo[cur].modified then
    vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
    return
  end

  local alt = vim.fn.bufnr "#"
  if alt ~= -1 and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
    vim.api.nvim_set_current_buf(alt)
  else
    vim.cmd "bnext"
  end

  -- if we didn't move (last listed buffer), open a fresh empty one
  if vim.api.nvim_get_current_buf() == cur then
    vim.cmd "enew"
  end

  if vim.api.nvim_buf_is_valid(cur) then
    pcall(vim.api.nvim_buf_delete, cur, {})
  end
end

-- Toggle catppuccin's transparent background at runtime
-- (replacement for base46.toggle_transparency).
function M.toggle_transparency()
  local cat = require "catppuccin"
  cat.options.transparent_background = not cat.options.transparent_background
  cat.compile()
  vim.cmd.colorscheme "catppuccin"
end

return M
