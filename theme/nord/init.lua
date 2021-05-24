local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'

local theme = {}

theme.icons = theme_dir .. '/icons/'
theme.font = 'Inter Regular 10'
theme.font_bold = 'Inter Bold 10'

-- Colorscheme
theme.nord0  = "#2E3440"
theme.nord1  = "#3B4252"
theme.nord2  = "#434C5E"
theme.nord3  = "#4C566A"
theme.nord4  = "#D8DEE9"
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#81A1C1"
theme.nord10 = "#5E81AC"
theme.nord11 = "#BF616A"
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.system_black_dark = '#2e3440'
theme.system_black_light = '#2e3440'

theme.system_red_dark = '#bf616a'
theme.system_red_light = 'bf616a'

theme.system_green_dark = '#a3be8c'
theme.system_green_light = '#a3be8c'

theme.system_yellow_dark = '#ebcb8b'
theme.system_yellow_light = '#ebcb8b'

theme.system_blue_dark = '#3b4252' 
theme.system_blue_light = '#3b4252'

theme.system_magenta_dark = '#985EFF'
theme.system_magenta_light = '#BD99FF'

theme.system_cyan_dark = '#24D1E7'
theme.system_cyan_light = '#87DFEB'

theme.system_white_dark = '#E5E5E5'
theme.system_white_light = '#F8F8F2'

-- Accent color
theme.accent = theme.nord3

-- Background color
-- Original version
--theme.background = '#192933'-- .. '100'

-- Darker version
theme.background = theme.nord0

-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme.icons .. 'awesome.svg'

local awesome_overrides = function(theme) end

return {
	theme = theme,
 	awesome_overrides = awesome_overrides
}
