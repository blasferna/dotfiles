local wezterm = require 'wezterm'

local config = {}

local home = os.getenv("HOME")

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.font = wezterm.font('JetBrains Mono', {weight='Thin'})

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'Tokyo Night'

config.window_background_image = home .. '/dotfiles/wezterm/background.jpg'
config.window_background_opacity = 1.0
config.window_background_image_hsb = {
  brightness = 0.03,
  saturation = 1.0,
  hue = 1.0,
}

config.foreground_text_hsb = {
    brightness = 1.2,
    saturation = 1.1,
    hue = 1.0,
}

return config
