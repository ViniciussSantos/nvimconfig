local on_attach = require("configs.base-lspconfig").on_attach
local capabilities = require("configs.base-lspconfig").capabilities

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local util = require "lspconfig.util"

local function register_lsp(name, cfg)
  vim.lsp.config[name] = vim.tbl_deep_extend("force", vim.lsp.config[name] or {}, cfg)
  vim.lsp.enable(name)
end

register_lsp("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
})

register_lsp("eslint", {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- clangd
register_lsp("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false

    on_attach(client, bufnr)

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
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = util.root_pattern(
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git"
  ),
})

register_lsp("gopls", {
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
})

register_lsp("bashls", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh" },
  bashIde = {
    globPattern = "*@(.sh|.inc|.bash|.command)",
  },
})

register_lsp("clojure_lsp", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "clojure", "edn" },
  root_dir = util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"),
})

register_lsp("zls", {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
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
  capabilities = capabilities,
  filetypes = { "zig", "zir" },
  root_dir = util.root_pattern("zls.json", ".git"),
})

register_lsp("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

register_lsp("ruff", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruff", "server" },
  filetypes = { "python" },
})

register_lsp("elp", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "elp", "server" },
  filetypes = { "erlang" },
  root_dir = util.root_pattern("rebar.config", "erlang.mk", ".git"),
})

register_lsp("nil_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "nil" },
  filetypes = { "nix" },
  root_dir = util.root_pattern("flake.nix", ".git"),
})

register_lsp("html", {
  on_attach = on_attach,
  capabilities = capabilities,
})

register_lsp("sqlls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
})
