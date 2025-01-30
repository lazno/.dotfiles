-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.initial_cols = 350
config.initial_rows = 80
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}
-- and finally, return the configuration to wezterm
return config
