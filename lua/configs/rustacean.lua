local on_attach = require("configs.base-lspconfig").on_attach
local capabilities = require("configs.base-lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
          extraArgs = { "--all", "--", "-W", "clippy::all" },
        },
      },
    },
    capabilities = capabilities,
  },
}
