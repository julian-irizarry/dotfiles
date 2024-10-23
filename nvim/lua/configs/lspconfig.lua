-- load defaults i.e lua_lsp
require("lspconfig").neocmake.setup {}
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd", "pyright", "asm_lsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.neocmake.setup {
  capabilities = capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
}

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
    source = "always",
    focusable = false,
    style = "minimal",
    header = "",
    prefix = "",
  },
}

-- Customize LSP handlers for hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
