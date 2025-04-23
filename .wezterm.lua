-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Builtin Solarized Dark'
config.color_scheme = 'Catppuccin Macchiato'
config.font_size = 15.0
config.keys = {
  { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
}

config.send_composed_key_when_left_alt_is_pressed = true

-- and finally, return the configuraiton to wezterm
return config
