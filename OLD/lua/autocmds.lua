-- require "nvchad.autocmds"

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

-------------------------------------- Neovide -----------------------------------------
if vim.g.neovide then
  vim.o.guifont = "RecMonoLinear Nerd Font:h15"
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 6
end

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

-- user event that loads after UIEnter + only if file buf is there
new_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})
