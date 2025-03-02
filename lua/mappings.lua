local gitsigns = require "gitsigns"

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

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

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
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope egrepify<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>cb", "<cmd>Telescope git_bcommits<CR>", { desc = "telescope git buffer commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>tc", "<cmd>Telescope conflicts<CR>", { desc = "telescope git conflicts" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "telescope list nodes with treesitter" })
map("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "telescope undo" })
map(
  "n",
  "<leader>td",
  "<cmd>Telescope lsp_document_symbols<CR>",
  { desc = "telescope Lists LSP symbols in current buffer" }
)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

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

-- General mappings
map("n", "<leader>to", function()
  require("base46").toggle_transparency()
end, { noremap = true, silent = true, desc = "Toggle transparency" })

-- Fugitive mappings
map("n", "<leader>gsf", "<cmd> G add % <CR>", { desc = "Git add file" })
map("n", "<leader>gst", "<cmd> G status <CR>", { desc = "Git status" })
map("n", "<leader>gss", "<cmd> G stash <CR>", { desc = "Git stash" })
map("n", "<leader>gsp", "<cmd> G stash pop <CR>", { desc = "Git stash pop" })
map("n", "<leader>gmc", "<cmd> Gvdiffsplit! <CR>", { desc = "Git 3 way pane for merge conflict resolution" })

-- Crates mappings
map("n", "<leader>rcu", function()
  require("crates").update_all_crates()
end, { desc = "Crate Update all crates to latest minor version" })

map("n", "<leader>rcr", function()
  require("crates").open_documentation()
end, { desc = "Crate Open documentation for crate under cursor" })

map("n", "<leader>rcp", function()
  require("crates").show_features_popup()
end, { desc = "Crate Open features select popup" })

-- Gitsigns mappings
map("n", "<leader>ghs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Git Stage hunk" })

map("v", "<leader>ghs", function()
  require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Git Stage hunk" })

-- Spectre mappings
map("n", "<leader>S", '<cmd> lua require("spectre").toggle() <CR>', { desc = "Spectre Toggle" })
map(
  "n",
  "<leader>sw",
  '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
  { desc = "Spectre Search current word" }
)
map(
  "n",
  "<leader>sp",
  '<cmd> lua require("spectre").open_file_search({select_word=true}) <CR>',
  { desc = "Spectre Search on current file" }
)
map(
  "v",
  "<leader>sw",
  '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
  { desc = "Spectre Search current word" }
)

-- Todo Comments mappings

-- custom mappings
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Floating diagnostic" })

-- treesitter mappings
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- gitsigns mappings
map("n", "<leader>gb", function()
  gitsigns.blame_line { full = false }
end, { desc = "git blame" })
map("n", "<leader>rh", gitsigns.reset_hunk, { desc = "reset hunk" })
map("n", "<leader>ph", gitsigns.preview_hunk, { desc = "preview hunk" })
