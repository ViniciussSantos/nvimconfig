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
map("n", "<leader>gmc", "<cmd> Gvdiffsplit! <CR>", { desc = "3 way pane for merge conflict resolution" })

-- Crates mappings
map("n", "<leader>rcu", function()
  require("crates").update_all_crates()
end, { desc = "Update all crates to latest minor version" })

map("n", "<leader>rcr", function()
  require("crates").open_documentation()
end, { desc = "Open documentation for crate under cursor" })

map("n", "<leader>rcp", function()
  require("crates").show_features_popup()
end, { desc = "Open features select popup" })

-- Gitsigns mappings
map("n", "<leader>ghs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })

map("v", "<leader>ghs", function()
  require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage hunk" })

-- Spectre mappings
map("n", "<leader>S", '<cmd> lua require("spectre").toggle() <CR>', { desc = "Toggle Spectre" })
map(
  "n",
  "<leader>sw",
  '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
  { desc = "Search current word" }
)
map(
  "n",
  "<leader>sp",
  '<cmd> lua require("spectre").open_file_search({select_word=true}) <CR>',
  { desc = "Search on current file" }
)
map(
  "v",
  "<leader>sw",
  '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
  { desc = "Search current word" }
)

-- Todo Comments mappings
map("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Search for TODOs" })

-- custom mappings
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
