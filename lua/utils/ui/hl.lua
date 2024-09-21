local M = {}

local border_color = vim.g.ui_accent or "yellow"

---@type Base46HLGroupsList
M.override = {
  FloatBorder = {
    fg = border_color,
  },
  SagaBorder = {
    fg = border_color,
  },
  RenamerBorder = {
    fg = border_color,
  },
  CodeActionMenuWarningMessageBorder = {
    fg = border_color,
  },
  DapUIFloatBorder = {
    fg = border_color,
  },
  TelescopeBorder = {
    fg = border_color,
  },
  TelescopePromptBorder = {
    fg = border_color,
  },
  CmpBorder = {
    fg = border_color,
  },
  Question = {
    italic = true,
    fg = "grey_fg",
  },
  TodoFgNote = {
    fg = "vibrant_green",
    bold = true,
  },
  TodoBgNote = {
    bg = "vibrant_green",
  },
  CursorLine = {
    bg = "black2",
  },
  NvimTreeRootFolder = {
    bold = true,
    fg = "green",
  },
  TbLineTabCloseBtn = {
    fg = "red",
  },
  TbLineBufOn = {
    fg = "green",
  },
  FoldColumn = {
    bg = "NONE",
  },
  NvDashAscii = {
    -- bg = "NONE",
    -- fg = "cyan",
  },
  NvDashButtons = {
    -- bg = "NONE",
    -- fg = "cyan",
  },
  Comment = {
    italic = true,
  },
  -- Imports
  Include = {
    bold = true,
    italic = true,
  },
  -- For, while loops
  Repeat = {
    bold = true,
    italic = true,
  },
  -- If statements
  Conditional = {
    bold = true,
    italic = true,
  },
  ["@comment"] = { italic = true },
  -- Try and Catch
  ["@exception"] = {
    bold = true,
    italic = true,
  },
  -- Class, with, as keywords
  ["@keyword"] = {
    bold = true,
    italic = true,
  },
  -- Function keyword
  ["@keyword.function"] = {
    bold = true,
    italic = true,
  },
  -- Return, yield keywords
  ["@keyword.return"] = {
    bold = true,
    italic = true,
  },
  -- Function names
  ["@function"] = {
    -- italic = true,
  },
  -- Function parameters
  ["@parameter"] = {
    -- italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  NvimtreeRootTab = { fg = "folder_bg", bold = true },
}

vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "FloatBorder" })

return M
