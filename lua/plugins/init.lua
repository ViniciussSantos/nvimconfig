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
    dependencies = {
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonToolsStartingInstall",
        callback = function()
          vim.schedule(function()
            print "mason-tool-installer is starting"
          end)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonToolsUpdateCompleted",
        callback = function(e)
          vim.schedule(function()
            print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
          end)
        end,
      })

      require("mason-tool-installer").setup {
        auto_update = true,
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
          "nil",
          "html-lsp",
        },
      }
    end,
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
    version = "^5",
    ft = { "rust" },
    config = function()
      require "configs.rustacean"
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    dependencies = "neovim/nvim-lspconfig",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      require "configs.haskell-tools"
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
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    opts = function()
      return require "configs.treesitter-textobjects"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
return plugins
