dofile(vim.g.base46_cache .. "mason")

local options = {
  PATH = "skip",
  ui = {
    border = vim.g.ui_border,
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },
  max_concurrent_installers = 10,
}

return options
