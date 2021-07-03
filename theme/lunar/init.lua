local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'

local theme = {}

theme.icons = theme_dir .. '/icons/'
theme.font = 'Inter Regular 10'
theme.font_bold = 'Inter Bold 10'

-- Colorscheme
theme.system_black_dark = '#4C566A'
theme.system_black_light = '#6C768A'

theme.system_red_dark = '#BF616A'
theme.system_red_light = '#af7370'

theme.system_green_dark = '#A3BE8C'
theme.system_green_light = '#B5CEA8'

theme.system_yellow_dark = '#D7BA7D'
theme.system_yellow_light = '#E7cb93'

theme.system_blue_dark = '#5e81ac' 
theme.system_blue_light = '#69A8C6'

theme.system_magenta_dark = '#B48EAD'
theme.system_magenta_light = '#939ede'

theme.system_cyan_dark = '#88c0d0'
theme.system_cyan_light = '#69BAC8'

theme.system_white_dark = '#ABB2BF'
theme.system_white_light = '#D8DEE9'

-- Accent color
theme.accent = theme.system_blue_dark

-- Background color
-- Original version
--theme.background = '#192933'-- .. '100'

-- Darker version
theme.background = '#232731'-- .. '100'
theme.foreground = '#e6e6e6' .. '1A'
theme.urgent = '#5e81ac'
theme.focus = '#6C768A' .. '80'

-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme.icons .. 'awesome.svg'

local awesome_overrides = function(theme) end

return {
	theme = theme,
 	awesome_overrides = awesome_overrides
}
