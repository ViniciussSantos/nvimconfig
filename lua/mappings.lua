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
  vim.lsp.buf.format { async = true }
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

-- comment
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

-- custom mappings
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Floating diagnostic" })

-- gitsigns mappings
map("n", "<leader>gb", function()
  gitsigns.blame_line { full = false }
end, { desc = "git blame" })
map("n", "<leader>rh", gitsigns.reset_hunk, { desc = "reset hunk" })
map("n", "<leader>ph", gitsigns.preview_hunk, { desc = "preview hunk" })

-- treesitter mappings
local select = require "nvim-treesitter-textobjects.select"
local swap = require "nvim-treesitter-textobjects.swap"
local move = require "nvim-treesitter-textobjects.move"
local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

-- Select text objects keymaps
vim.keymap.set({ "x", "o" }, "a=", function()
  select.select_textobject("@assignment.outer", "textobjects")
end, { desc = "Select outer part of an assignment" })

vim.keymap.set({ "x", "o" }, "i=", function()
  select.select_textobject("@assignment.inner", "textobjects")
end, { desc = "Select inner part of an assignment" })

vim.keymap.set({ "x", "o" }, "l=", function()
  select.select_textobject("@assignment.lhs", "textobjects")
end, { desc = "Select left hand side of an assignment" })

vim.keymap.set({ "x", "o" }, "r=", function()
  select.select_textobject("@assignment.rhs", "textobjects")
end, { desc = "Select right hand side of an assignment" })

vim.keymap.set({ "x", "o" }, "a:", function()
  select.select_textobject("@property.outer", "textobjects")
end, { desc = "Select outer part of an object property" })

vim.keymap.set({ "x", "o" }, "i:", function()
  select.select_textobject("@property.inner", "textobjects")
end, { desc = "Select inner part of an object property" })

vim.keymap.set({ "x", "o" }, "l:", function()
  select.select_textobject("@property.lhs", "textobjects")
end, { desc = "Select left part of an object property" })

vim.keymap.set({ "x", "o" }, "r:", function()
  select.select_textobject("@property.rhs", "textobjects")
end, { desc = "Select right part of an object property" })

vim.keymap.set({ "x", "o" }, "aa", function()
  select.select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select outer part of a parameter/argument" })

vim.keymap.set({ "x", "o" }, "ia", function()
  select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inner part of a parameter/argument" })

vim.keymap.set({ "x", "o" }, "ai", function()
  select.select_textobject("@conditional.outer", "textobjects")
end, { desc = "Select outer part of a conditional" })

vim.keymap.set({ "x", "o" }, "ii", function()
  select.select_textobject("@conditional.inner", "textobjects")
end, { desc = "Select inner part of a conditional" })

vim.keymap.set({ "x", "o" }, "al", function()
  select.select_textobject("@loop.outer", "textobjects")
end, { desc = "Select outer part of a loop" })

vim.keymap.set({ "x", "o" }, "il", function()
  select.select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inner part of a loop" })

vim.keymap.set({ "x", "o" }, "af", function()
  select.select_textobject("@call.outer", "textobjects")
end, { desc = "Select outer part of a function call" })

vim.keymap.set({ "x", "o" }, "if", function()
  select.select_textobject("@call.inner", "textobjects")
end, { desc = "Select inner part of a function call" })

vim.keymap.set({ "x", "o" }, "am", function()
  select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer part of a method/function definition" })

vim.keymap.set({ "x", "o" }, "im", function()
  select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner part of a method/function definition" })

vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end, { desc = "Select outer part of a class" })

vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner part of a class" })

-- Swap text objects keymaps
vim.keymap.set("n", "<leader>a", function()
  swap.swap_next "@parameter.inner"
end, { desc = "Swap with next parameter" })

vim.keymap.set("n", "<leader>pn", function()
  swap.swap_next "@function.outer"
end, { desc = "Swap with next function" })

vim.keymap.set("n", "<leader>A", function()
  swap.swap_previous "@parameter.inner"
end, { desc = "Swap with previous parameter" })

vim.keymap.set("n", "<leader>pm", function()
  swap.swap_previous "@function.outer"
end, { desc = "Swap with previous function" })

-- Move to next start keymaps
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start("@call.outer", "textobjects")
end, { desc = "Next function call start" })

vim.keymap.set({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next method/function def start" })

vim.keymap.set({ "n", "x", "o" }, "]c", function()
  move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class start" })

vim.keymap.set({ "n", "x", "o" }, "]i", function()
  move.goto_next_start("@conditional.outer", "textobjects")
end, { desc = "Next conditional start" })

vim.keymap.set({ "n", "x", "o" }, "]l", function()
  move.goto_next_start("@loop.outer", "textobjects")
end, { desc = "Next loop start" })

vim.keymap.set({ "n", "x", "o" }, "]s", function()
  move.goto_next_start("@local.scope", "locals")
end, { desc = "Next scope" })

vim.keymap.set({ "n", "x", "o" }, "]z", function()
  move.goto_next_start("@fold", "folds")
end, { desc = "Next fold" })

-- Move to next end keymaps
vim.keymap.set({ "n", "x", "o" }, "]F", function()
  move.goto_next_end("@call.outer", "textobjects")
end, { desc = "Next function call end" })

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer", "textobjects")
end, { desc = "Next method/function def end" })

vim.keymap.set({ "n", "x", "o" }, "]C", function()
  move.goto_next_end("@class.outer", "textobjects")
end, { desc = "Next class end" })

vim.keymap.set({ "n", "x", "o" }, "]I", function()
  move.goto_next_end("@conditional.outer", "textobjects")
end, { desc = "Next conditional end" })

vim.keymap.set({ "n", "x", "o" }, "]L", function()
  move.goto_next_end("@loop.outer", "textobjects")
end, { desc = "Next loop end" })

-- Move to previous start keymaps
vim.keymap.set({ "n", "x", "o" }, "[f", function()
  move.goto_previous_start("@call.outer", "textobjects")
end, { desc = "Prev function call start" })

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Prev method/function def start" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
  move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Prev class start" })

vim.keymap.set({ "n", "x", "o" }, "[i", function()
  move.goto_previous_start("@conditional.outer", "textobjects")
end, { desc = "Prev conditional start" })

vim.keymap.set({ "n", "x", "o" }, "[l", function()
  move.goto_previous_start("@loop.outer", "textobjects")
end, { desc = "Prev loop start" })

-- Move to previous end keymaps
vim.keymap.set({ "n", "x", "o" }, "[F", function()
  move.goto_previous_end("@call.outer", "textobjects")
end, { desc = "Prev function call end" })

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer", "textobjects")
end, { desc = "Prev method/function def end" })

vim.keymap.set({ "n", "x", "o" }, "[C", function()
  move.goto_previous_end("@class.outer", "textobjects")
end, { desc = "Prev class end" })

vim.keymap.set({ "n", "x", "o" }, "[I", function()
  move.goto_previous_end("@conditional.outer", "textobjects")
end, { desc = "Prev conditional end" })

vim.keymap.set({ "n", "x", "o" }, "[L", function()
  move.goto_previous_end("@loop.outer", "textobjects")
end, { desc = "Prev loop end" })

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
