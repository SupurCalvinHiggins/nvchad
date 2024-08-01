-- Load default LSP configuration.
local config = require("plugins.configs.lspconfig")

-- Add format on write.
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  -- Call default NVChad on_attach.
  config.on_attach(client, bufnr)
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

-- Configure Python LSP (formatting).
lspconfig.ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configure C/CPP LSP.
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configure Rust LSP.
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configure LUA LSP.
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})
