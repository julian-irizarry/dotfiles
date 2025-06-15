-- Load defaults i.e. lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local mason_lspconfig = require "mason-lspconfig"

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Customize diagnostic signs (icons in the gutter)
-- sign({ name = "DiagnosticSignError", text = "x" })
-- sign({ name = "DiagnosticSignWarn", text = "▲" })
-- sign({ name = "DiagnosticSignHint", text = "⚑" })
-- sign({ name = "DiagnosticSignInfo", text = "»" })

-- Configure diagnostic behavior and appearance
vim.diagnostic.config {
  virtual_text = {
    spacing = 10,
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    focusable = false,
    style = "minimal",
    header = "",
    prefix = "",
  },
}

-- Customize LSP handlers for hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
