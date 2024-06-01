local elixir = require "elixir"
local elixirls = require "elixir.elixirls"

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

elixir.setup {
  nextls = { enable = false },
  credo = { enable = false },
  elixirls = {
    enable = true,
    settings = elixirls.settings {
      dialyzerEnabled = false,
      enableTestLenses = false,
    },
    capabilities = capabilities,
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
  },
}
