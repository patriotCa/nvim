local new_autocmd = vim.api.nvim_create_autocmd
local new_cmd = vim.api.nvim_create_user_command
local new_augroup = function(name)
  return vim.api.nvim_create_augroup("nvchad_" .. name, { clear = true })
end

-- local d_term = vim.api.nvim_exec("echo $TERM", true)

-------------------------------------- Dynamic terminal padding -----------------------------------------
-- autocmd("VimEnter", {
--   command = ":silent !kitty @ set-spacing padding=0 margin=0",
-- })
--
-- autocmd("VimLeavePre", {
--   command = ":silent !kitty @ set-spacing padding=20 margin=10",
-- })

-------------------------------------- Highlight on Yank -----------------------------------------
new_autocmd("TextYankPost", {
  group = new_augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-------------------------------------- Restore cursor position -----------------------------------------
new_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-------------------------------------- Auto Resize -----------------------------------------
new_autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-------------------------------------- Toggle Formater -----------------------------------------
new_cmd("FormatDisable", function(args)
  vim.notify = require "notify"
  vim.notify("Disabled Format after save", "info", { title = "conform.nvim" })

  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable format after save",
  bang = true,
})

new_cmd("FormatEnable", function()
  vim.notify = require "notify"
  vim.notify("Enabled Format after save", "info", { title = "conform.nvim" })

  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable format after save",
})

-------------------------------------- Clipboard in WSL without xclip -----------------------------------------
-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ['+'] = 'clip.exe',
--     ['*'] = 'clip.exe',
--   },
--   paste = {
--     ['+'] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ['*'] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }
