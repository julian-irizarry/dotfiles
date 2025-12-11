return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function(_, opts)
			opts.winopts = {
				preview = {
					vertical = "up:65%",
					layout = "vertical",
					wrap = true,
				},
			}
			opts.keymap = {
				builtin = {
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					["<C-j>"] = "preview-page-down",
					["<C-k>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			}
		end,
	},

	{ "folke/which-key.nvim",    enabled = false },

	{ "vimpostor/vim-tpipeline", event = "VeryLazy" },

	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require "configs.conform",
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"c",
				"python",
				"cmake",
				"cpp",
			},

			highlightghlight = {
				enable = true, -- Enable syntax highlighting
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require "configs.nvim-treesitter-textobjects"
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		opts = function(_, opts)
			-- Customize or extend the existing options
			opts.hijack_cursor = false
			opts.update_cwd = true
			opts.update_focused_file = {
				enable = true,
				update_cwd = true,
			}

			-- Attach the custom keybinding setup (on_attach)
			opts.on_attach = function(bufnr)
				local api = require "nvim-tree.api"
				api.config.mappings.default_on_attach(bufnr)
			end

			return opts
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup {
				-- Configuration here, or leave empty to use defaults
			}
		end,
	},

	{ "mbbill/undotree",     lazy = false },

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup {}
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{ 'mrjones2014/smart-splits.nvim', lazy = false },
	{
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
	}
}
