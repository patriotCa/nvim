pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

local options = {
  ensure_installed = {
    "lua",
    "luadoc",
    "printf",
    "vim",
    "vimdoc",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "svelte",
    "c",
    "zig",
    "markdown",
    "markdown_inline",
    "bash",
    "dot",
    "rasi",
    "sxhkdrc",
    "ssh_config",
    "sql",
    "meson",
    "ninja",
    "make",
    "llvm",
    "ini",
    "graphql",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "fsh",
    "fish",
    "awk",
    "astro",
    "diff",
    "jsdoc",
    "json",
    "jsonc",
    "luap",
    "python",
    "query",
    "regex",
    "toml",
    "yaml",
  },
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Cr>",
      node_incremental = "<Cr>",
      scope_incremental = false,
      node_decremental = "<Bs>",
    },
  },
}

return options
