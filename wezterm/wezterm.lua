local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'GoMono Nerd Font'
config.font_size = 13
config.color_scheme = 'Ubuntu'
config.window_background_opacity = 0.70  

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}
config.native_macos_fullscreen_mode = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.enable_tab_bar = false

return config
