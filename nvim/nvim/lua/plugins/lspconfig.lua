local Plugin = { 'neovim/nvim-lspconfig' }
local user = {}

Plugin.dependencies = {
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "folke/neodev.nvim",                  config = true, opts = { window = { blend = 30 } } },
	{ "smjonas/inc-rename.nvim",            config = true },
	{ 'williamboman/mason-lspconfig.nvim',  lazy = true },
	{
		'williamboman/mason.nvim',
		cmd = { 'Mason', 'LspInstall', 'LspUnInstall' },
		config = function() user.setup_mason() end
	},
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
}

Plugin.cmd = 'LspInfo'

Plugin.event = { 'BufReadPre', 'BufNewFile' }

function Plugin.init()
	local sign = function(opts)
		-- See :help sign_define()
		vim.fn.sign_define(opts.name, {
			texthl = opts.name,
			text = opts.text,
			numhl = ''
		})
	end

	sign({ name = 'DiagnosticSignError', text = 'x' })
	sign({ name = 'DiagnosticSignWarn', text = '▲' })
	sign({ name = 'DiagnosticSignHint', text = '⚑' })
	sign({ name = 'DiagnosticSignInfo', text = '»' })

	-- See :help vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = {
			spacing = 10
		},
		severity_sort = true,
		float = {
			border = 'rounded',
			source = 'always',
		},
	})

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{ border = 'rounded' }
	)

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = 'rounded' }
	)
end

function Plugin.config()
	-- See :help lspconfig-global-defaults
	local lspconfig = require('lspconfig')
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities = vim.tbl_deep_extend(
		'force',
		lsp_defaults.capabilities,
		require('cmp_nvim_lsp').default_capabilities()
	)

	local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

	vim.api.nvim_create_autocmd('LspAttach', {
		group = group,
		desc = 'LSP actions',
		callback = user.on_attach
	})

	-- See :help mason-lspconfig-dynamic-server-setup
	require('mason-lspconfig').setup_handlers({
		function(server)
			-- See :help lspconfig-setup
			lspconfig[server].setup({})
		end,
		['tsserver'] = function()
			lspconfig.tsserver.setup({
				settings = {
					completions = {
						completeFunctionCalls = true
					}
				}
			})
		end,
		['lua_ls'] = function()
			require('plugins.lsp.lua_ls')
		end,
		['pyright'] = function()
			lspconfig.pyright.setup({
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						}
					}
				}
			})
		end
	})
end

function user.setup_mason()
	-- See :help mason-settings
	require('mason').setup({
		ui = { border = 'rounded' },
		ensure_installed = {
			'pyright',
			'clangd',
			'clang-format',
			'codelldb'
		}
	})

	-- See :help mason-lspconfig-settings
	require('mason-lspconfig').setup({
		ensure_installed = {
			'clangd',
			'pyright',
			'cmake',
			'dockerls',
			'docker_compose_language_service',
			'bashls'
		}
	})
end

function user.on_attach()
	local bufmap = function(mode, lhs, rhs)
		local opts = { buffer = true }
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- You can search each function in the help page.
	-- For example :help vim.lsp.buf.hover()

	bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
	bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
	bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
	bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
	bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
	bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
	bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
	bufmap('n', '<leader>rn', ':IncRename ')
	-- bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
	bufmap({ 'n', 'x' }, '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
	bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
	bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
	bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	bufmap('n', '<leader>D', "<cmd>lua vim.lsp.buf.type_definition()<cr>")

	bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
	bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

	-- if using Neovim v0.8 uncomment this
	-- bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
end

return Plugin
