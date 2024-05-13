local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.prettierd.with {
    extra_args = function()
      return {
        "--single-quote",
      }
    end,
  },
  formatting.clang_format,
  diagnostics.clj_kondo,
  formatting.yamlfix,
  formatting.shfmt,
  formatting.gofumpt,
  formatting.goimports_reviser,
  diagnostics.mypy.with {
    extra_args = function()
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  },
  diagnostics.pylint,
  formatting.nixpkgs_fmt,
}

local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
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
}

return opts
