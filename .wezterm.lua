-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Builtin Solarized Dark'
config.font_size = 15.0

-- and finally, return the configuraiton to wezterm
return config
