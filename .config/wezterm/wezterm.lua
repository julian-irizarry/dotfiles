local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local rose_pine_black = require 'rose_pine_black'

tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'iTerm2 Pastel Dark Background',
    theme_overrides = {
      normal_mode = {
        a = { bg = '#ff9da4' },  -- Workspace section with Rose Pine red
        z = { bg = '#ff9da4' },  -- Domain section with Rose Pine red
      },
      tab = {
        active = { fg = '#ffffff' },  -- Active tab text to be white
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
    tabline_a = { 'workspace' },
    tabline_b = {},
    tabline_c = { ' ' },
    tab_active = {
      '',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
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
    window:set_config_overrides({window_background_opacity = 1.0,
    colors = { background = "black"}})
end)

wezterm.on("set-opacity-reduced", function(window, pane)
    window:set_config_overrides({window_background_opacity = 0.85,
    colors = { background = "black"}})
end)

config.keys = {
  -- Existing keybindings
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

  -- Tab management (similar to kitty)
  -- Ctrl+t to create a new tab
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },

  -- Vim-style tab navigation
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },

  -- Direct tab switching
  {
    key = '1',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(8),
  },

  -- Close tab (similar to Alt+w in kitty)
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab{confirm=false},
  },

  -- Toggle layout similar to kitty's ctrl+shift+f
  {
    key = 'f',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },

  -- Opacity controls (similar to kitty's ctrl+f11/f12)
  {
    key = 'F11',
    mods = 'CTRL',
    action = wezterm.action{EmitEvent="set-opacity-full"},
  },
  {
    key = 'F12',
    mods = 'CTRL',
    action = wezterm.action{EmitEvent="set-opacity-reduced"},
  }
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Custom tab bar style
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Apply tabline.wez plugin configuration to wezterm config
tabline.apply_to_config(config)

return config
