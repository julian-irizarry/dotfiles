-- keymaps.lua
local wezterm = require "wezterm"
local act = wezterm.action

-- Ctrl+Shift+Z: toggle *both* fullscreen and tab bar (zen mode)
local toggle_zen = wezterm.action_callback(function(window, pane)
  local o = window:get_config_overrides() or {}

  -- flip tab bar visibility
  if o.enable_tab_bar == false then
    o.enable_tab_bar = nil   -- restore to config default (shows tab bar)
    -- (optional) if you also tweak decorations, restore them:
    -- o.window_decorations = nil
  else
    o.enable_tab_bar = false -- hide tab bar (tabline.wez disappears too)
    -- (optional) strip window chrome when not fullscreen:
    -- o.window_decorations = "RESIZE"
  end

  window:set_config_overrides(o)
  window:perform_action(act.ToggleFullScreen, pane)
end)

local M = {}

-- CSI-u helper: smart-splits listens to these sequences from the terminal.
-- Ctrl variants use ;5u, Alt variants use ;3u
local function csiu(char_code, mod) -- mod: 5 = Ctrl, 3 = Alt
	return string.format("\x1b[%d;%du", char_code, mod)
end

function M.keymaps()
	return {
		-- ===== Your existing essentials =====
		{ key = "n",   mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
		{ key = "u",   mods = "CTRL",       action = act.SendString("\x15") },

		-- Tabs: spawn / relative nav / direct access
		{ key = "t",   mods = "CTRL|SHIFT", action = act.SpawnTab "CurrentPaneDomain" },
		{ key = "h",   mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "l",   mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
		{ key = "1",   mods = "CTRL",       action = act.ActivateTab(0) },
		{ key = "2",   mods = "CTRL",       action = act.ActivateTab(1) },
		{ key = "3",   mods = "CTRL",       action = act.ActivateTab(2) },
		{ key = "4",   mods = "CTRL",       action = act.ActivateTab(3) },
		{ key = "5",   mods = "CTRL",       action = act.ActivateTab(4) },
		{ key = "6",   mods = "CTRL",       action = act.ActivateTab(5) },
		{ key = "7",   mods = "CTRL",       action = act.ActivateTab(6) },
		{ key = "8",   mods = "CTRL",       action = act.ActivateTab(7) },
		{ key = "9",   mods = "CTRL",       action = act.ActivateTab(8) },

		{ key = "w",   mods = "CTRL|SHIFT", action = act.CloseCurrentTab { confirm = false } },
		{ key = "f",   mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },

		-- Your opacity toggles (hook your events in wezterm.lua)
		{ key = "F11", mods = "CTRL",       action = act.EmitEvent "set-opacity-full" },
		{ key = "F12", mods = "CTRL",       action = act.EmitEvent "set-opacity-reduced" },

		-- ===== Smart-splits movement (Neovim <-> WezTerm) =====
		-- Send CSI-u sequences so smart-splits can decide whether to move vim split or wezterm pane
		{ key = "h",   mods = "CTRL",       action = act.SendString(csiu(104, 5)) }, -- Ctrl+h
		{ key = "j",   mods = "CTRL",       action = act.SendString(csiu(106, 5)) }, -- Ctrl+j
		{ key = "k",   mods = "CTRL",       action = act.SendString(csiu(107, 5)) }, -- Ctrl+k
		{ key = "l",   mods = "CTRL",       action = act.SendString(csiu(108, 5)) }, -- Ctrl+l

		-- ===== Smart-splits resize (works in vim splits and wezterm panes) =====
		{ key = "h",   mods = "ALT",        action = act.SendString(csiu(104, 3)) }, -- Alt+h: resize left
		{ key = "j",   mods = "ALT",        action = act.SendString(csiu(106, 3)) }, -- Alt+j: resize down
		{ key = "k",   mods = "ALT",        action = act.SendString(csiu(107, 3)) }, -- Alt+k: resize up
		{ key = "l",   mods = "ALT",        action = act.SendString(csiu(108, 3)) }, -- Alt+l: resize right

		-- ===== Splits =====
		-- Ctrl+Shift+Enter => vertical split (pane to the RIGHT)
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = act.SplitPane { direction = "Right", size = { Percent = 50 } }
		},
		-- Ctrl+Shift+_ (SHIFT+"-") => horizontal split (pane DOWN)
		{
			key = "-",
			mods = "CTRL|SHIFT",
			action = act.SplitPane { direction = "Down", size = { Percent = 50 } }
		},

		-- ===== Move tab left/right (kitty-like) =====
		{ key = ",", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = ".", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },

		-- ===== Tab Navigator =====
		{ key = "t", mods = "CTRL|ALT",   action = act.ShowTabNavigator },

		-- ===== Pane selector (jump to any pane quickly) =====
		{
			key = "p",
			mods = "CTRL|ALT",
			action = act.PaneSelect { alphabet = "1234567890" }
		},

		-- ===== Launcher (fuzzy picker: workspaces, launch menu, domains) =====
		{
			key = "Space",
			mods = "CTRL|ALT",
			action = act.ShowLauncherArgs {
				flags = "FUZZY|LAUNCH_MENU_ITEMS|WORKSPACES|DOMAINS",
			}
		},

		-- ===== Search in scrollback =====
		{
			key = 'f',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.TogglePaneZoomState,
		},

		-- ===== Copy mode (non-conflicting; keep Ctrl+Shift+C for Copy if you use it) =====
		{ key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },


		-- ===== Search in scrollback =====
		{
			key = "g",
			mods = "CTRL|SHIFT",
			action = act.Search { CaseInSensitiveString = "" }
		},

		-- ===== Close pane/tab (auto-cascades) =====
		{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane { confirm = false } },

		-- Ctrl+Shift+Z => zen toggle (fullscreen + hide/show tab bar)
		{ key = "z", mods = "CTRL|SHIFT", action = toggle_zen },

		-- Ctrl+Shift+N => just fullscreen
		{ key = "n", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
	}
end

return M
