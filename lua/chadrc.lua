-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local border = "rounded" or vim.g.ui_border
local hl = require "utils.ui.hl"
local ct = require "utils.ui.ct"

M.base46 = {
  theme = "chadracula", -- default theme
  theme_toggle = { "chadracula", "one_light" },
  changed_themes = ct,
  transparency = false,
  hl_add = hl.add,
  hl_override = hl.override,
  integrations = {
    "alpha",
    "blankline",
    "bufferline",
    "cmp",
    "codeactionmenu",
    "dap",
    "defaults",
    "devicons",
    "git",
    "hop",
    "lsp",
    "lspsaga",
    "mason",
    "navic",
    "neogit",
    "notify",
    "nvcheatsheet",
    "nvdash",
    "nvimtree",
    "nvshades",
    "rainbowdelimiters",
    "semantic_tokens",
    "statusline",
    "syntax",
    "tbline",
    "telescope",
    "todo",
    "treesitter",
    "trouble",
    "vim-illuminate",
    "whichkey",
  },
}

M.ui = {
  border = border,
  accent = "yellow",
  lspsaga = false,
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    ghost_text = false,
  },
  telescope = { style = "bordered" }, -- borderless / bordered
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    -- modules = nil,
    modules = {
      lsp_msg = "",
    },
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    -- modules = nil,
    modules = {
      treeOffset = function()
        local api = vim.api
        local function title_and_leftWidth()
          for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
            if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
              return "%#NvimTreeNormal#"
                .. "%#NvimtreeRootTab# File Tree"
                .. string.rep(" ", api.nvim_win_get_width(win) - 10)
            end
          end
          return ""
        end
        return title_and_leftWidth()
      end,
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    -- width = 0.5,
    -- height = 0.4,
    -- border = "single",
    width = 0.99,
    height = 0.85,
    border = border,
  },
}

M.lsp = {
  signature = true,
  virtual_text = true,
}

M.cheatsheet = {
  theme = "grid", -- simple/grid
  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}

M.mason = { cmd = true, pkgs = {} }

return M
