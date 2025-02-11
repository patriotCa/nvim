dofile(vim.g.base46_cache .. "mason")

return {
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
