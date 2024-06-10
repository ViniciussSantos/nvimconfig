local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "fourmolu",
        "typescript-language-server",
        "prettierd",
        "eslint-lsp",
        "gopls",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "zls",
        "clojure-lsp",
        "clj-kondo",
        "yamlfix",
        "shfmt",
        "bash-language-server",
        "gofumpt",
        "goimports-reviser",
        "mypy",
        "ruff-lsp",
        "pyright",
        "elixir-ls",
        "elp",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = "neovim/nvim-lspconfig",
    version = "^4",
    ft = { "rust" },
    config = function()
      require "configs.rustacean"
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    dependencies = "neovim/nvim-lspconfig",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      require "configs.haskell-tools"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "User FilePost",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },

  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    ft = { "elixir" },
    config = function()
      require "configs.elixir-tools"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact", "typescript.tsx" },
    config = function()
      require "configs.tsc"
    end,
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
}
return plugins
