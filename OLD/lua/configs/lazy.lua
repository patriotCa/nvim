return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  ui = {
    border = vim.g.ui_border or require("chadrc").ui.border,
    wrap = true, -- wrap the lines in the ui
    title = " Lazy Manager ", ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
