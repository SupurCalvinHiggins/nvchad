-- Load default LSP configuration.
local config = require("plugins.configs.lspconfig")

-- Add format on write.
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  -- Call default NVChad on_attach.
  config.on_attach(client, bufnr)

  -- Fix bug in default NVChad on_attach.
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  -- Add format on write.
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end
local capabilities = config.capabilities

-- Configure LSP servers.
local lspconfig = require("lspconfig")

-- Configure Python LSP.
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
