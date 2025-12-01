-- keymaps.lua
local wezterm = require "wezterm"
local act = wezterm.action

-- Ctrl+Shift+Z: toggle *both* fullscreen and tab bar (zen mode)
local toggle_zen = wezterm.action_callback(function(window, pane)
	-- enter/exit fullscreen first for GNOME top bar reliability
	window:perform_action(act.ToggleFullScreen, pane)

	-- flip tab bar a moment later
	wezterm.time.call_after(0.01, function()
		local o = window:get_config_overrides() or {}
		if o.enable_tab_bar == false then
			o.enable_tab_bar = nil -- restore default (show tab bar)
		else
			o.enable_tab_bar = false -- hide tab bar (tabline disappears too)
		end
		window:set_config_overrides(o)
	end)
end)

local M = {}

-- normal/global keybindings
function M.keymaps()
	return {
		-- ===== Essentials =====
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

		-- Opacity toggles (your events are in wezterm.lua)
		{ key = "F11", mods = "CTRL",       action = act.EmitEvent "set-opacity-full" },
		{ key = "F12", mods = "CTRL",       action = act.EmitEvent "set-opacity-reduced" },

		-- ===== Splits =====
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = act.SplitPane { direction = "Right", size = { Percent = 50 } }
		},
		{
			key = "-",
			mods = "CTRL|SHIFT",
			action = act.SplitPane { direction = "Down", size = { Percent = 50 } }
		},

		-- Move tab left/right
		{ key = "<", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = ">", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },

		-- Tab Navigator
		{ key = "t", mods = "CTRL|ALT",   action = act.ShowTabNavigator },

		-- Close pane
		{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane { confirm = false } },

		-- Zen toggle (fullscreen + toggle tab bar)
		{ key = "z", mods = "CTRL|SHIFT", action = toggle_zen },

		-- Just fullscreen (kept, per your note)
		{ key = "n", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },

		-- This opens the search UI prefilled with current selection (if any)
		{ key = "/", mods = "CTRL|SHIFT", action = act.Search("CurrentSelectionOrEmptyString") },
	}
end

-- copy_mode key table: Vim-style search
function M.key_tables()
	local defaults = wezterm.gui and wezterm.gui.default_key_tables() or {}

	-- start from defaults so we keep all built-ins
	local copy     = {}
	local search   = {}
	if defaults.copy_mode then for _, v in ipairs(defaults.copy_mode) do table.insert(copy, v) end end
	if defaults.search_mode then for _, v in ipairs(defaults.search_mode) do table.insert(search, v) end end

	-- --- COPY MODE: jump like Vim, and clean exit ---
	-- Use 'n' / 'N' to move between matches *after* you've set a pattern
	table.insert(copy, { key = "n", mods = "NONE", action = act.CopyMode "NextMatch" })
	table.insert(copy, { key = "N", mods = "SHIFT", action = act.CopyMode "PriorMatch" })

	-- Optional: map '/' in copy mode to open the Search overlay (instead of EditPattern prompt)
	table.insert(copy, { key = "/", mods = "NONE", action = act.Search("CurrentSelectionOrEmptyString") })

	-- Leaving copy mode should also clear the pattern so the overlay doesn't "ghost" later
	table.insert(copy,
		{ key = "X", mods = "CTRL|SHIFT", action = act.Multiple { act.CopyMode "ClearPattern", act.CopyMode "Close" } })
	table.insert(copy,
		{ key = "Escape", mods = "NONE", action = act.Multiple { act.CopyMode "ClearPattern", act.CopyMode "Close" } })

	-- --- SEARCH MODE: make Enter/Esc dismiss overlay cleanly (and return focus) ---
	-- ENTER: accept the pattern -> jump, then go back to normal Cell selection in copy mode
	table.insert(search, {
		key = "Enter",
		mods = "NONE",
		action = act.Multiple {
			act.CopyMode "AcceptPattern",
			act.CopyMode { SetSelectionMode = "Cell" },
		},
	})

	-- ESC: clear the pattern (prevents ghosting), accept (to close overlay), return to Cell selection
	table.insert(search, {
		key = "Escape",
		mods = "NONE",
		action = act.Multiple {
			act.CopyMode "ClearPattern",
			act.CopyMode "AcceptPattern",
			act.CopyMode { SetSelectionMode = "Cell" },
		},
	})

	return {
		copy_mode   = copy,
		search_mode = search,
	}
end

return M
