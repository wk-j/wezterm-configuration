local wezterm = require 'wezterm'
local config = { }

config.window_frame = {
    font = wezterm.font "Syne Mono",
    font_size = 14,
    border_bottom_height = '0cell'
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 10,
    bottom = 0
}

config.initial_cols = 120
config.color_scheme = 'Batman'
-- config.color_scheme = 'carbonfox'
config.font = wezterm.font "Mononoki Nerd Font"
config.font_size = 14.3
config.line_height = 1.5
config.text_background_opacity = 0.3
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"

-- config.cursor_tickness = "200%"
-- config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

return config
