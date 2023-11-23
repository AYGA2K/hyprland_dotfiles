local wezterm = require("wezterm")

local config = {}
config.color_scheme = "tokyonight_night"
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.line_height = 1.2
config.colors = {
	background = "#11121D",
	foreground = "#FDFDFD",
}

config.scrollback_lines = 3000

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- Tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = true
config.disable_default_key_bindings = true
config.cursor_blink_rate = 80

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{ event = { Up = { streak = 1, button = "Left" } }, mods = "CTRL", action = wezterm.action.OpenLinkAtMouseCursor },
}
local act = wezterm.action
config.keys = {
	-- Switch tabs using Alt + 1, 2, 3, ...
	{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },

	{ key = "t", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },

	{ key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },

	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	-- use hjkl instead of arrow keys for history and modify command input

	{ key = "h", mods = "ALT", action = act.SendKey({ key = "LeftArrow" }) },
	{ key = "j", mods = "ALT", action = act.SendKey({ key = "DownArrow" }) },
	{ key = "k", mods = "ALT", action = act.SendKey({ key = "UpArrow" }) },
	{ key = "l", mods = "ALT", action = act.SendKey({ key = "RightArrow" }) },
}

return config
