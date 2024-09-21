-- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()

local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "F", vim.diagnostic.open_float, opts "Lsp Floating Diagnostic")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>ra", function()
    -- require "nvchad.lsp.renamer"()
    -- require("utils.lsp.renamer")
    vim.lsp.buf.rename()
  end, opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map("v", "<C-Space>", vim.lsp.buf.code_action, opts "Lsp Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  -- require("nvchad.lsp").diagnostic_config()
  require("utils.lsp").diagnostic_config()

  local lspconfig = require "lspconfig"
  local util = require "lspconfig.util"

  lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  local servers = {
    html = {},
    cssls = {},
    ts_ls = {},
    tailwindcss = {},
    bashls = {
      cmd = { "bash-language-server", "start" },
      settings = {
        bashIde = {
          globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.zsh|.inc|.bash|.command)",
        },
      },
      filetypes = { "sh", "zsh" },
      root_dir = util.find_git_ancestor,
      single_file_support = true,
    },
    jsonls = {},
    clangd = {},
    intelephense = {
      root_dir = function(pattern)
        local cwd = vim.loop.cwd()
        local root = util.root_pattern("composer.json", ".git")(pattern)

        -- prefer cwd if root is a descendant
        return util.path.is_descendant(cwd, root) and cwd or root
      end,
    },
    pyright = {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "basic",
          },
        },
      },
    },
  }

  for name, opts in pairs(servers) do
    opts.on_init = M.on_init
    opts.on_attach = M.on_attach
    opts.capabilities = M.capabilities

    lspconfig[name].setup(opts)
  end
end

return M

-- -- EXAMPLE
-- local servers = { "html", "cssls" }
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
