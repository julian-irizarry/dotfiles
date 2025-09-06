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
lspconfig.nixd.setup {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        -- For flake.
        -- This expression will be interpreted as "nixpkgs" toplevel
        -- Nixd provides package, lib completion/information from it.
        -- Resource Usage: Entries are lazily evaluated, entire nixpkgs takes 200~300MB for just "names".
        -- Package documentation, versions, are evaluated by-need.
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
      },
    },
  },

  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

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
