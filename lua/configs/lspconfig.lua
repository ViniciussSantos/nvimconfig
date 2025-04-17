local on_attach = require("configs.base_lsp").on_attach
local capabilities = require("configs.base_lsp").capabilities

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false

    on_attach(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  capabilities = capabilities,

  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh" },
  bashIde = {
    globPattern = "*@(.sh|.inc|.bash|.command)",
  },
}

lspconfig.clojure_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "clojure", "edn" },
  root_dir = util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"),
}

lspconfig.zls.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true

    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  capabilities = capabilities,
  filetypes = { "zig", "zir" },
  root_dir = util.root_pattern("zls.json", ".git"),
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.ruff.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruff", "server" },
  filetypes = { "python" },
}

lspconfig.elp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "elp", "server" },
  filetypes = { "erlang" },
  root_dir = util.root_pattern("rebar.config", "erlang.mk", ".git"),
}

lspconfig.nil_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "nil" },
  filetypes = { "nix" },
  root_dir = util.root_pattern("flake.nix", ".git"),
}

require("lspconfig").html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
}
