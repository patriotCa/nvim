local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    -- lua stuff
    lua = { "stylua" },
    -- web stuff
    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    markdown = { "deno_fmt" },
    json = { "deno_fmt" },
    jsonc = { "deno_fmt" },
    vue = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    handlebars = { "prettier" },
    graphql = { "prettier" },
    -- bash stuff
    sh = { "shfmt" },
    python = { "isort", "black" },
  },
  format_after_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { lsp_fallback = true }
  end,
  notify_on_error = true,
}

-- require("conform").setup(options)

return options
