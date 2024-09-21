return {
  "nvim-lua/plenary.nvim",
  {
    "NvChad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "NvChad/ui",
    lazy = false,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      -- return { override = require "nvchad.icons.devicons" }
      return { override = require "utils.icons.devicons" }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = require "configs.blankline",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "antosha417/nvim-lsp-file-operations",
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      -- return require "nvchad.configs.nvimtree"
      return require "configs.nvimtree"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      "<c-r>",
      "<c-w>",
      '"',
      "'",
      "`",
      "c",
      "v",
      "g",
    },
    cmd = "WhichKey",
    opts = function()
      return require "configs.whichkey"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
  -- formatting!
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      return require "configs.conform"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    -- enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      return require "configs.linter"
    end,
  },
  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      -- return require "nvchad.configs.gitsigns"
      return require "configs.gitsigns"
    end,
  },
  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      -- return require "nvchad.configs.mason"
      return require "configs.mason"
    end,
    config = function(_, opts)
      if opts.ensure_installed then
        vim.api.nvim_echo({
          { "\n   ensure_installed has been removed! use M.mason.pkgs table in your chadrc.\n", "WarningMsg" },
          { "   https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua#L85 \n\n", "FloatBorder" },
          {
            "   MasonInstallAll will automatically install all mason packages of tools configured in your plugins. \n",
            "healthSuccess",
          },
          { "   Currently supported plugins are : lspconfig, nvim-lint, conform. \n", "Added" },
          { "   So dont add them in your chadrc as MasonInstallAll automatically installs them! \n", "Changed" },
        }, false, {})
      end

      require("mason").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      -- require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig").defaults()
    end,
  },
  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          -- require "nvchad.configs.luasnip"
          require "configs.luasnip"
        end,
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      -- return require "nvchad.configs.cmp"
      return require "configs.cmp"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      -- return require "nvchad.configs.telescope"
      return require "configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    opts = {
      user_default_options = { names = false },
      filetypes = {
        "*",
        "!lazy",
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "axelvc/template-string.nvim",
      "windwp/nvim-ts-autotag",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      -- return require "nvchad.configs.treesitter"
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("template-string").setup()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      -- require("Comment").setup(opts)
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = function()
      return require("configs.comment").todo_comments
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup(opts)
    end,
  },
  {
    "mrjones2014/legendary.nvim",
    lazy = false,
    config = function()
      require "configs.legendary"
    end,
    dependencies = {
      "hinell/duplicate.nvim",
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require("dressing").setup {
        select = {
          get_config = function(opts)
            if opts.kind == "codeaction" then
              return {
                backend = "telescope",
                telescope = require("telescope.themes").get_cursor(),
              }
            end
          end,
        },
      }
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "fedepujol/move.nvim",
    lazy = false,
    config = function()
      require("move").setup {
        line = {
          enable = true, -- Enables line movement
          indent = true, -- Toggles indentation
        },
        block = {
          enable = true, -- Enables block movement
          indent = true, -- Toggles indentation
        },
        word = {
          enable = true, -- Enables word movement
        },
        char = {
          enable = false, -- Enables char movement
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    opts = function()
      return require "configs.fidget"
    end,
    config = function(_, opts)
      require("fidget").setup(opts)
    end,
  },
}
