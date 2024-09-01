require "nvchad.mappings"

local map = vim.keymap.set

-- General mappings
map("n", "<leader>to", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

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
map("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Search for TODOs" })

-- custom mappings
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Floating diagnostic" })

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f, { expr = true })
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F, { expr = true })
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t, { expr = true })
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T, { expr = true })
