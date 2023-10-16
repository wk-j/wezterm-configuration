local wezterm = require 'wezterm'
local config = { }
local act = wezterm.action

config.window_frame = {
    font = wezterm.font "ShureTechMono Nerd Font",
    font_size = 15,
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.initial_cols = 120
config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font_with_fallback {
  'Mononoki Nerd Font',
}
config.font_size = 14.3
config.line_height = 1.5
config.window_background_opacity = 0.98
config.window_decorations = "RESIZE"
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.leader = { key = ';',  mods = "CMD", timeout_milliseconds = 1000 }
config.keys = {
    { key = "-", mods = "LEADER",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "h", mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER",       action = act.ActivatePaneDirection("Right") },
}

config.status_update_interval = 1000
wezterm.on("update-right-status", function(window, pane)
  local time = wezterm.strftime("%H:%M")
  window:set_right_status(wezterm.format({
    { Text = " " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = " " },
  }))
end)

return config
