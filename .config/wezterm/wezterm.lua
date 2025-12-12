local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local rose_pine_black = require 'rose_pine_black'
local keys = require "keymaps"

-- Helper to get SSH hostname from pane (using tabline's pane structure)
local function get_ssh_host(pane)
	-- tabline passes a table with properties, not methods
	local process_name = pane.foreground_process_name or ""
	-- Check if the process is ssh
	if not process_name:match("ssh$") then
		return nil
	end

	-- Try to extract hostname from the pane title
	-- SSH often sets the terminal title to user@host or similar
	local title = pane.title or ""

	-- Try common patterns in SSH titles
	-- Pattern: user@hostname
	local host = title:match("@([%w%-%._]+)")
	if host then
		return host
	end

	-- Pattern: hostname (just the host if title is set)
	-- Check if title looks like a hostname (not a local path)
	if title ~= "" and not title:match("^/") and not title:match("^~") then
		-- Could be hostname or "user@host: path" format
		local potential_host = title:match("^([%w%-%._]+)")
		if potential_host and potential_host ~= process_name then
			return potential_host
		end
	end

	return "ssh"
end

tabline.setup({
	options = {
		icons_enabled = true,
		theme = 'iTerm2 Pastel Dark Background',
		theme_overrides = {
			normal_mode = {
				a = { bg = '#ff9da4' },
				z = { bg = '#ff9da4' },
			},
			tab = {
				active = { fg = '#ffffff' },
			}
		},
		tabs_enabled = true,
		section_separators = '',
		component_separators = '',
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		-- Show MODE only when in a special key table (copy_mode, search_mode, etc.)
		tabline_a = {
			{
				'mode',
				cond = function(window)
					local kt = window:active_key_table()
					return kt ~= nil and kt ~= '' and kt ~= 'normal_mode'
				end,
				fmt = function(s) return s:gsub('_mode$', '') end, -- "copy", "search", etc.
				-- optional: add an icon
				-- icon = wezterm.nerdfonts.md_magnify,
			},
		},
		-- tabline_a = {},
		tabline_b = {},
		tabline_c = { ' ' },

		-- ACTIVE TAB: Neovim icon + parent/cwd (or SSH host) + zoom indicator
		tab_active = {
			'',
			{
				'process',
				icons_only = true,
				process_to_icon = {
					nvim = { wezterm.nerdfonts.custom_neovim, color = { fg = '#a6e3a1' } },
					ssh = { wezterm.nerdfonts.md_server, color = { fg = '#f5c2e7' } },
				},
				padding = { left = 0, right = 0 },
			},
			' ',
			-- Custom component: show SSH hostname or parent/cwd
			function(tab)
				local pane = tab.active_pane
				local ssh_host = get_ssh_host(pane)
				if ssh_host then
					return ssh_host
				end
				-- Fall back to parent/cwd for non-SSH
				local cwd_uri = pane.current_working_dir
				if cwd_uri then
					-- cwd_uri is a URL string like "file:///path/to/dir"
					local cwd = type(cwd_uri) == "string" and cwd_uri:gsub("^file://", "") or (cwd_uri.file_path or "")
					local parent = cwd:match(".*/([^/]+)/[^/]+$") or ""
					local current = cwd:match(".*/([^/]+)$") or cwd
					if parent ~= "" then
						return parent .. "/" .. current
					end
					return current
				end
				return ""
			end,
			{ 'zoomed', padding = 0 },
		},

		-- INACTIVE TAB: Neovim icon + cwd (or SSH host)
		tab_inactive = {
			'',
			{
				'process',
				icons_only = true,
				process_to_icon = {
					nvim = { wezterm.nerdfonts.custom_neovim, },
					ssh = { wezterm.nerdfonts.md_server, },
				},
				padding = { left = 0, right = 0 },
			},
			' ',
			-- Custom component: show SSH hostname or cwd
			function(tab)
				local pane = tab.active_pane
				local ssh_host = get_ssh_host(pane)
				if ssh_host then
					-- Truncate long hostnames
					if #ssh_host > 18 then
						return ssh_host:sub(1, 15) .. "..."
					end
					return ssh_host
				end
				-- Fall back to cwd for non-SSH
				local cwd_uri = pane.current_working_dir
				if cwd_uri then
					-- cwd_uri is a URL string like "file:///path/to/dir"
					local cwd = type(cwd_uri) == "string" and cwd_uri:gsub("^file://", "") or (cwd_uri.file_path or "")
					local current = cwd:match(".*/([^/]+)$") or cwd
					if #current > 18 then
						return current:sub(1, 15) .. "..."
					end
					return current
				end
				return ""
			end,
		},

		tabline_x = { 'cpu', 'datetime' },
		tabline_y = {},
		tabline_z = { 'domain' },
	},
	extensions = {},
})


local config = {}

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 13

-- Color scheme options:
-- config.color_scheme = 'iTerm2 Pastel Dark Background'
config.colors = rose_pine_black


config.window_background_opacity = 0.85

-- Opacity control functions (similar to kitty's ctrl+f11/f12)
wezterm.on("set-opacity-full", function(window, pane)
	window:set_config_overrides({
		window_background_opacity = 1.0,
		colors = { background = "black" }
	})
end)

wezterm.on("set-opacity-reduced", function(window, pane)
	window:set_config_overrides({
		window_background_opacity = 0.85,
		colors = { background = "black" }
	})
end)

config.keys = keys.keymaps()
config.key_tables = keys.key_tables()

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Custom tab bar style
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 10000

tabline.apply_to_config(config)
smart_splits.apply_to_config(config)

return config
