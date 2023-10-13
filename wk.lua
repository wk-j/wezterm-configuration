local wezterm = require 'wezterm'
local config = { }
local act = wezterm.action

config.window_frame = {
    -- font = wezterm.font "DaddyTimeMono Nerd Font",
    font = wezterm.font "ShureTechMono Nerd Font",
    -- font = wezterm.font "OpenDyslexic",
    font_size = 15,
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.initial_cols = 120
config.color_scheme = 'Batman'
-- config.color_scheme = 'carbonfox'
config.font = wezterm.font "Mononoki Nerd Font"
config.font_size = 14.3
config.line_height = 1.6
-- config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"

-- config.cursor_tickness = "200%"
-- config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.leader = { key = ";", mods = "CMD", timeout_milliseconds = 1000 }
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
  -- Workspace name
  local stat = window:active_workspace()
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then stat = window:active_key_table() end
  if window:leader_is_active() then stat = "LDR" end

  -- Current working directory
  local basename = function(s)
    -- Nothign a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  local cwd = basename(pane:get_current_working_dir())
  -- Current command
  local cmd = basename(pane:get_foreground_process_name())

  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Let's add color to one of the components
  window:set_right_status(wezterm.format({
    -- Wezterm has a built-in nerd fonts
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "FFB86C" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = "  " },
  }))
end)

return config
