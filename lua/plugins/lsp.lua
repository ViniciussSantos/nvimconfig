return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.base-lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "configs.mason"
    end,
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
          "ruff",
          "pyright",
          "elixir-ls",
          "elp",
          "nil",
          "html-lsp",
          "sqlls",
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
    ft = { "rust" },
    config = function()
      require "configs.rustacean"
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
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
}
