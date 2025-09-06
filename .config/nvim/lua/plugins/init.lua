return {
	{
		'mikesmithgh/kitty-scrollback.nvim',
		enabled = true,
		lazy = true,
		cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
		event = { 'User KittyScrollbackLaunch' },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
		  require('kitty-scrollback').setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, conf)
			-- Extend the existing `opts` table
			conf.pickers = vim.tbl_deep_extend('force', conf.pickers or {}, {
				find_files = {
					-- theme = "ivy"
				},
				buffers = {
					ignore_current_buffer = true,
					sort_lastused = true,
				}
			})
			conf.defaults = vim.tbl_deep_extend("force", conf.defaults or {}, {
				sorting_strategy = "descending",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
			})

			-- Add fzf extension options
			conf.extensions = vim.tbl_deep_extend("force", conf.extensions or {}, {
				fzf = {},
			})

			return conf
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
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			-- Unbind existing keybinds
			{ "<c-h>",  nil },
			{ "<c-j>",  nil },
			{ "<c-k>",  nil },
			{ "<c-l>",  nil },
			{ "<c-\\>", nil },

			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		event = "VeryLazy"
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
		}
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

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- {
	--   "christoomey/vim-tmux-navigator",
	--   config = function()
	--     vim.g.tmux_navigator_disable_when_zoomed = 1
	--   end,
	-- },

	{ "mbbill/undotree",     lazy = false },

	{ "Mofiqul/vscode.nvim", opts = { transparent = false, italic_comments = true, disable_nvimtree_bg = true } },

	{
		"nvim-telescope/telescope-fzy-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension "fzy"
		end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
		opts = {
			arg = "leetcode.nvim",
			lang = "cpp",
			image_support = true,
			injector = {
				["python3"] = {
					before = true,
				},
				["cpp"] = {
					before = {
						"#include <bits/stdc++.h>",
						"#include <vector>",
						"#include <unordered_map>",
						"using namespace std;",
					},
					after = "int main() {}",
				},
				["java"] = {
					before = "import java.util.*;",
				},
			},
		},
	},

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
}
