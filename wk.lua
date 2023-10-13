local wezterm = require 'wezterm'
local config = { }

config.window_frame = {
    font = wezterm.font "Syne Mono",
    font_size = 14,
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

config.background = {
    {
        source = {
            File = "/Users/wk/.config/wezterm/bg/k.jpeg",
        },
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.99
    }
}

return config
