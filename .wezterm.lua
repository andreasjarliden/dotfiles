-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Builtin Solarized Dark'
config.color_scheme = 'Catppuccin Mocha'

config.font_size = 14.0

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()

-- Custom key mappings
config.keys = {
  { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
  { key = 'v', mods = 'CTRL|ALT', action = wezterm.action.SplitHorizontal },
  { key = 'h', mods = 'CTRL|ALT', action = wezterm.action.SplitVertical },
}

-- Needed for left option key to work in MacOS
config.send_composed_key_when_left_alt_is_pressed = true

-- and finally, return the configuraiton to wezterm
return config
