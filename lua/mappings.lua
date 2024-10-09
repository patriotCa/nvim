-- require "nvchad.mappings"

local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })
map("i", "<A-Right>", "<Esc>", { desc = "Escape" })
map("i", "<C-S-Left>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-S-Right>", "<End>", { desc = "End of line" })
map("i", "<C-Enter>", "<Esc>o", { desc = "Go to new line" })
map("i", "<C-Z>", "<C-O>u", { desc = "Undo" })
map("i", "<C-Y>", "<C-O><C-R>", { desc = "Redo" })
map("i", " ", " <c-g>u", { desc = "Undo before space" })
map("i", ",", ",<c-g>u", { desc = "Undo before ," })
map("i", ".", ".<c-g>u", { desc = "Undo before ." })
map("i", ";", ";<c-g>u", { desc = "Undo before ;" })
map("i", ":", ":<c-g>u", { desc = "Undo before :" })
map({ "i", "n", "v", "x" }, "<C-s>", "<Esc><Cmd>w<CR>", { desc = "Save file" })
map({ "i", "n", "v", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select whole file" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<C-Z>", "u", { desc = "Undo" })
map("n", "<C-Y>", "<C-R>", { desc = "Redo" })
map("n", "<C-Enter>", "<Esc>o", { desc = "Go to new line" })
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })
map("n", "<S-s>", "<C-W>p", { desc = "Switch Other Window" })
map("n", "<S-q>", function()
  if vim.fn.win_getid() ~= 1000 then
    vim.cmd ":close"
  end
end, { desc = "Delet Current Window" })
map("n", "_", "<C-W>s", { desc = "Split window below" })
map("n", "|", "<C-W>v", { desc = "Split window right" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map("n", "<leader>eI", vim.show_pos, { desc = "Inspect Pos" })
map("n", "I", ":Inspect<CR>", { desc = "Inspect Pos", silent = true })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<C-c>", '"+y$', { desc = "Copy file" })
map("n", "<C-c>", '"+d$', { desc = "Cut file" })
map("n", "<leader>en", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
map("n", "<leader>er", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })
map("n", "<leader>ch", "<cmd> enew <CR>", { desc = "New buffer" })
map("n", "<leader>uh", "<cmd>NvCheatsheet<CR>", { desc = "Toggle NvCheatsheet" })
map("n", "<S-Left>", "<C-Left>", { desc = "Move First Character Left" })
map("n", "<S-Right>", "<C-Right>", { desc = "Move First Character Right" })
map("n", "<C-S-Left>", "v<Left>", { desc = "Selection Left" })
map("n", "<C-S-Right>", "v<Right>", { desc = "Selection Right" })

-- global lsp mappings
-- map("n", "<leader>fm", function()
-- 	vim.lsp.buf.format({ async = true })
-- end, { desc = "Lsp formatting" })
map("n", "<leader>cf", function()
  require("conform").format {}
end, { desc = "Lsp formatting" })

map("n", "<leader>cta", "<cmd>ToggleAlternate<cr>", { desc = "Toggle Alternate" })
map("n", "<leader>ctl", "<cmd>Lspsaga winbar_toggle<cr>", { desc = "Toggle Lspsaga Winbar" })
map("n", "<leader>ctF", function(global)
  local vars, bufnr, cmd
  if global then
    vars = vim.g
    bufnr = nil
  else
    vars = vim.b
    bufnr = 0
  end
  vars.diagnostics_disabled = not vars.diagnostics_disabled
  if vars.diagnostics_disabled then
    cmd = "disable"
    vim.api.nvim_echo({ { "Disabling diagnostics" } }, false, {})
  else
    cmd = "enable"
    vim.api.nvim_echo({ { "Enabling diagnostics" } }, false, {})
  end
  vim.schedule(function()
    vim.diagnostic[cmd](bufnr)
  end)
end, { desc = "Toggle Lsp Diagnostic" })

map("n", "<leader>ctb", function()
  if vim.g.transparency then
    vim.api.nvim_echo({ { "Disabling transparency" } }, false, {})
  else
    vim.api.nvim_echo({ { "Enabling transparency" } }, false, {})
  end

  require("base46").toggle_transparency()
end, { desc = "Toggle Transparency" })
map("n", "<leader>ctf", function()
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.cmd "FormatEnable"
  else
    vim.cmd "FormatDisable"
  end
end, { desc = "Toggle Format on save" })
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

-- tabufline
-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<S-A-Left>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move to prev buffer" })

map("n", "<S-A-Right>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move to next buffer" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map("n", "<leader>+", "<Cmd>tabnew<CR>", { desc = "Create new tab" })
map("n", "<leader>-", "<Cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "L", "<Cmd>tabnex<CR>", { desc = "Goto next tab" })
map("n", "H", "<Cmd>tabprev<CR>", { desc = "Goto prev tab" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

map({ "n", "v" }, "<leader>egl", "<Cmd>CBline<CR>", { desc = "Toggle Simple Line" })
map({ "n", "v" }, "<leader>egL", "<Cmd>CBllline<CR>", { desc = "Toggle Titled Line" })
map({ "n", "v" }, "<leader>egb", "<Cmd>CBccbox<CR>", { desc = "Toggle Box Titles" })
map({ "n", "v" }, "<leader>egB", "<Cmd>CBllbox14<CR>", { desc = "Marked" })
map({ "n", "v" }, "<leader>egX", "<Cmd>CBd<CR>", { desc = "Delete Comment Box" })

map("s", "<C-Z>", "<esc>u", { desc = "Undo" })
map("s", "<C-Y>", "<esc><C-R>", { desc = "Redo" })
map("x", "<C-c>", '"+y', { desc = "Copy file" })
map("x", "<C-x>", '"+d', { desc = "Cut file" })
map("x", "<C-Z>", "<esc>u", { desc = "Undo" })
map("x", "<C-Y>", "<esc><C-R>", { desc = "Redo" })
map("v", "<S-Tab>", "<gv", { desc = "Indent line" })
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<C-Z>", "<esc>u", { desc = "Undo" })
map("v", "<C-Y>", "<esc><C-R>", { desc = "Redo" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- nvimtree
map("n", "<C-b>", function()
  local nvimTree = require "nvim-tree.api"
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "starter" then
    return
  else
    nvimTree.tree.toggle()
  end
end, { desc = "Nvimtree Toggle window" })
map("n", "<leader>eb", function()
  local nvimTree = require "nvim-tree.api"
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "starter" then
    return
  else
    nvimTree.tree.focus()
  end
end, { desc = "Nvimtree Focus window" })
map("n", "<leader>n", function()
  local nvimTree = require "nvim-tree.api"
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "starter" then
    return
  else
    nvimTree.tree.toggle()
  end
end, { desc = "Nvimtree Focus window" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })

map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>tT", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>et", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })
map(
  "n",
  "<leader>ea",
  "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>",
  { desc = "Find bookmarked all", silent = true, noremap = true }
)
map(
  "n",
  "<leader>ec",
  "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>",
  { desc = "Find bookmarked current", silent = true, noremap = true }
)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "Open LazyGit" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp", size = 0.3 }
end, { desc = "Terminal New vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- whichkey
map("n", "<leader>za", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>zq", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Blankline Jump to current context" })

-- move
map("i", "<A-Up>", "<ESC>:MoveLine(-1)<CR>", { desc = "Move Line UP", silent = true, noremap = true })
map("i", "<A-Down>", "<ESC>:MoveLine(1)<CR>", { desc = "Move Line DOWN", silent = true, noremap = true })
map("n", "<A-Up>", ":MoveLine(-1)<CR>", { desc = "Move Line UP", silent = true, noremap = true })
map("n", "<A-Down>", ":MoveLine(1)<CR>", { desc = "Move Line DOWN", silent = true, noremap = true })
map("v", "<A-Up>", ":MoveBlock(-1)<CR>", { desc = "Move Line UP", silent = true, noremap = true })
map("v", "<A-Down>", ":MoveBlock(1)<CR>", { desc = "Move Line DOWN", silent = true, noremap = true })
