local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local rose_pine_black = require 'rose_pine_black'
local keys = require "keymaps"


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
		-- tabline_a = { 'workspace' },
		tabline_a = {},
		tabline_b = {},
		tabline_c = { ' ' },
		tab_active = {
			'',
			{ 'parent', padding = 0 },
			'/',
			{ 'cwd',    padding = { left = 0, right = 1 } },
			{ 'zoomed', padding = 0 },
		},
		tab_inactive = { '', { 'process', padding = { left = 0, right = 1 } } },
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

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Custom tab bar style
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

tabline.apply_to_config(config)

return config
