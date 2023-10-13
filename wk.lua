local wezterm = require 'wezterm'
local config = { }

config.window_frame = {
    font = wezterm.font "Agave Nerd Font",
    font_size = 14
}

config.initial_cols = 120
config.color_scheme = 'Batman'
config.font = wezterm.font "Mononoki Nerd Font"
config.font_size = 14.5
config.line_height = 1.5
config.text_background_opacity = 0.3
config.window_background_opacity = 0.98
config.window_decorations = "RESIZE"

return config
