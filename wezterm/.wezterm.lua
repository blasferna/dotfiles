local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

local function get_home()
  if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    return os.getenv("USERPROFILE")
  else
    return os.getenv("HOME")
  end
end

local home = get_home()

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.font = wezterm.font('JetBrains Mono', {weight='Thin'})
-- TODO: get value dynamically according if there is a GPU or not.
config.front_end = 'Software'

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

config.use_fancy_tab_bar = false

config.keys = {
    { key = 'F', mods = 'CTRL|SHIFT', action = act.ShowTabNavigator },
    { key = 'P', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'V', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'H', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'X', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = true } },
    { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
}

return config
