local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local icons = require('theme.icons')

local create_widget = function()
	local exit_widget = wibox.widget {
	{	
        {
			widget = wibox.widget.imagebox,
			image = icons.logout,
			resize = true
		},
        margins = dpi(9),
        widget = wibox.container.margin
    },
		layout = wibox.layout.align.vertical
	}

	local exit_button = wibox.widget {
		
			exit_widget,
			widget = clickable_container

		}   
   
	exit_button:buttons(
		awful.util.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awesome.emit_signal('module::exit_screen:show')
				end
			)
		)
	)
     awful.tooltip(
		{
			objects = {exit_button},
			mode = 'outside',
			align = 'right',
			margin_leftright = dpi(8),
			margin_topbottom = dpi(8),
			text = 'End Session',
			preferred_positions = {'right', 'left', 'top', 'bottom'}
		}
                  )
	return exit_button
end

return create_widget
