-- Load default LSP configuration.
local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

-- Configure LSP servers.
local lspconfig = require("lspconfig")

-- Configure Python LSP.
lspconfig.pyright.setup({
  on_attach=on_attach,
  capabilities=capabilities,
})

-- Configure C-like LSP.
lspconfig.clangd.setup({
  on_attach=on_attach,
  capabilities=capabilities,
})
