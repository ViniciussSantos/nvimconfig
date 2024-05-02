local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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
        "elixirls",
        "nixpkgs-fmt",
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
    version = "^3",
    ft = { "rust" },
    config = function()
      require "custom.configs.rustacean"
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    dependencies = "neovim/nvim-lspconfig",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      require "custom.configs.haskell-tools"
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {
  --       suggestion = {
  --         auto_trigger = true,
  --       },
  --     }
  --   end,
  -- },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
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
      require("core.utils").load_mappings "crates"
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
      require "custom.configs.elixir-tools"
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
      require "custom.configs.tsc"
    end,
    opts = {},
  },
}
return plugins
