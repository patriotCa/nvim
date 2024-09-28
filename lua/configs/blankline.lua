dofile(vim.g.base46_cache .. "blankline")

local options = {
  indent = {
    char = "│",
    highlight = "IblChar",
  },
  scope = {
    enabled = true,
    show_start = false,
    highlight = "IblScopeChar",
    include = {
      node_type = { ["*"] = { "*" } },
      -- node_type = { typescriptreact = { "return_statement", "table_constructor" } },
    },
    -- exclude = {
    --   node_type = {
    --     ["*"] = {
    --       "source_file",
    --       "program",
    --       "chunk",
    --       "module",
    --     },
    --   },
    -- },
  },
  -- whitespace = {
  --   highlight = "IblScopeChar",
  --   remove_blankline_trail = false,
  -- },
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
