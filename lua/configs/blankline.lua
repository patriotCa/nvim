dofile(vim.g.base46_cache .. "blankline")

local options = {
  indent = { char = "│", highlight = "IblChar" },
  scope = {
    char = "│",
    highlight = "IblScopeChar",
    enabled = false,
  },
  exclude = {
    buftypes = {
      "nofile",
      "terminal",
      "quickfix",
      "prompt",
    },
    filetypes = {
      "terminal",
      "help",
      "dashboard",
      "alpha",
      "neo-tree",
      "NvimTree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "noice",
      "terminal",
      "toggleterm",
      "lazyterm",
      "startify",
      "aerial",
      "neogitstatus",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "sagaoutline",
      "query",
      "",
    },
  },
}

return options
