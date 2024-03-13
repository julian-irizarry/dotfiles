local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 13
config.color_scheme = 'Black'
local opacity_levels = {
	{opacity = 1, color = "0D0D0D"},
	{opacity = 0.93, color = "black"}
}

local current_opacity_indx = 1

wezterm.on("toggle-opacity", function(window, pane)
	current_opacity_indx = 3 - current_opacity_indx
	local config = opacity_levels[current_opacity_indx]
	window:set_config_overrides({window_background_opacity = config.opacity,
	colors = { background = config.color}})
end)

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  {
	  key = 'u',
	  mods = 'CTRL',
	  action = wezterm.action{SendString="\x15"}
  },
  {
	  key = 'u',
	  mods = 'ALT',
	  action = wezterm.action{EmitEvent="toggle-opacity"}
  }
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
return config
