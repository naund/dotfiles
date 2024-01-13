-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMono NF")
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_background_opacity = 0.7
config.text_background_opacity = 0.9
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config
