local on_attach = require("configs.base-lspconfig").on_attach
local capabilities = require("configs.base-lspconfig").capabilities
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.g.haskell_tools = {
  hls = {
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
  },
}
