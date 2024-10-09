dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
        results_width = 0.4,
      },
      width = 0.99,
      height = 0.95,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}
