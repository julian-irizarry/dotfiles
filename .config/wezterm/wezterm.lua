local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local rose_pine_black = require 'rose_pine_black'
local keys = require "keymaps"
local tabline_config = require 'plugins.tabline'

local tabline = tabline_config.setup()

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

-- Active pane indication: dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.6,
}

tabline.apply_to_config(config)
smart_splits.apply_to_config(config)

return config
