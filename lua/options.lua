require("nvchad.options")

-- add yours here! ROOT

local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.cursorlineopt = "both" -- to enable cursorline!
-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.wrap = false -- Disable line wrap

vim.filetype.add({
	extension = {
		zsh = "sh",
		sh = "sh",
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
})

-------------------------------------- globals -----------------------------------------
-- g.toggle_theme_icon = "   "
g.ui_border = require("chadrc").ui.border
g.ui_accent = require("chadrc").ui.accent
g.ui_lspsaga = require("chadrc").ui.lspsaga
g.ui_cmp_ghost_text = require("chadrc").ui.cmp.ghost_text
g.ui_cmp_csborder = require("chadrc").ui.cmp.csborder
g.lsp_virtual_text = require("chadrc").lsp.virtual_text
g.vscode_snippets_path = "~/.config/nvim/lua/snippets"
