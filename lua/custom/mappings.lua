local M = {}

M.general = {
  n = {
    ["<leader>to"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
}

M.fugitive = {
  n = {
    ["<leader>gsf"] = { "<cmd> G add % <CR>", "Git add file" },
    ["<leader>gst"] = { "<cmd> G status <CR>", "Git status" },
    ["<leader>gss"] = { "<cmd> G stash <CR>", "Git stash" },
    ["<leader>gsp"] = { "<cmd> G stash pop <CR>", "Git stash pop" },
    ["<leader>gmc"] = { "<cmd> Gvdiffsplit! <CR>", "3 way pane for merge conflict resolution" },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").update_all_crates()
      end,
      "Update all crates to latest minor version",
    },
    ["<leader>rcr"] = {
      function()
        require("crates").open_documentation()
      end,
      "Open documentation for crate under cursor",
    },

    ["<leader>rcp"] = {
      function()
        require("crates").show_features_popup()
      end,
      "open features select popup",
    },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    ["<leader>ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
  },
  v = {
    ["<leader>ghs"] = {
      function()
        require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Stage hunk",
    },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = {
      '<cmd> lua require("spectre").toggle() <CR>',
      "Toggle Spectre",
    },

    ["<leader>sw"] = {
      '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
      "Search current word",
    },

    ["<leader>sp"] = {
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      "Search on current file",
    },
  },

  v = {
    ["<leader>sw"] = {
      '<cmd> lua require("spectre").open_visual({select_word=true}) <CR>',
      "Search current word",
    },
  },
}

M.todo_comments = {
  n = {
    ["<leader>tt"] = {
      "<cmd>TodoTelescope<CR>",
      "Search for TODOs",
    },
  },
}

return M
