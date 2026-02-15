local base_on_attach = require("configs.base-lspconfig").on_attach
local base_capabilities = require("configs.base-lspconfig").capabilities

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local util = require "lspconfig.util"

local function register_lsp(name, cfg)
  vim.lsp.config[name] = vim.tbl_deep_extend("force", vim.lsp.config[name] or {}, cfg)
  vim.lsp.enable(name)
end

register_lsp("ts_ls", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
})

register_lsp("eslint", {
  on_attach = function(client, bufnr)
    base_on_attach(client, bufnr)
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function()
    --     vim.lsp.buf.format()
    --   end,
    -- })
  end,
})

register_lsp("clangd", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
})

register_lsp("gopls", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
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
})

register_lsp("bashls", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  filetypes = { "sh" },
  bashIde = {
    globPattern = "*@(.sh|.inc|.bash|.command)",
  },
})

register_lsp("clojure_lsp", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  filetypes = { "clojure", "edn" },
  root_dir = util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"),
})

register_lsp("zls", {
  on_attach = function(client, bufnr)
    base_on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true

    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  capabilities = base_capabilities,
  filetypes = { "zig", "zir" },
  root_dir = util.root_pattern("zls.json", ".git"),
})

register_lsp("pyright", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  filetypes = { "python" },
})

register_lsp("ruff", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  init_options = {
    settings = {
      configuration = {
        format = {
          ["quote-style"] = "preserve",
        },
      },
    },
  },
  cmd = { "ruff", "server" },
  filetypes = { "python" },
})

register_lsp("elp", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  cmd = { "elp", "server" },
  filetypes = { "erlang" },
  root_dir = util.root_pattern("rebar.config", "erlang.mk", ".git"),
})

register_lsp("nil_ls", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
  cmd = { "nil" },
  filetypes = { "nix" },
  root_dir = util.root_pattern("flake.nix", ".git"),
})

register_lsp("html", {
  on_attach = base_on_attach,
  capabilities = base_capabilities,
})
