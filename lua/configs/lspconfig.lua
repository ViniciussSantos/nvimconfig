local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local function find_ruff_toml()
  local cwd = vim.fn.expand "%:p:h"
  local toml = vim.fn.findfile("ruff.toml", cwd)
  if toml ~= "" then
    return toml
  end
  return ""
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
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

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruff-lsp" },
  filetypes = { "python" },
}

lspconfig.elp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "elp", "server" },
  filetypes = { "erlang" },
  root_dir = util.root_pattern("rebar.config", "erlang.mk", ".git"),
}
