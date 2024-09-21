dofile(vim.g.base46_cache .. "nvimtree")

local options = {
  filters = {
    git_ignored = false,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    no_bookmark = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  reload_on_bufenter = true,
  view = {
    signcolumn = "no",
    adaptive_size = false,
    side = "left",
    -- width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  diagnostics = {
    enable = false,
  },
  renderer = {
    -- root_folder_label = ":~:s?$?/..?",
    root_folder_label = function(path)
      return "~  " .. vim.fn.fnamemodify(path, ":t")
    end,
    highlight_git = true,
    highlight_diagnostics = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    highlight_bookmarks = "none",
    highlight_clipboard = "name",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = "  ",
      },
    },

    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        },
      },
      git_placement = "after",
      modified_placement = "after",
      diagnostics_placement = "signcolumn",
      bookmarks_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        diagnostics = true,
        bookmarks = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        bookmark = "",
        modified = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return options
