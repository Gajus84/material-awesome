local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local tag_list2 = require('widget.tag-list2')
local task_list2 = require('widget.task-list2')

local side_panel = function(s)

	-- Set right panel geometry
	local panel_width = dpi(35)
	local panel_x = s.geometry.x + s.geometry.width - panel_width

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		width = panel_width,
		height = s.geometry.height,
		x = panel_x,
		y = s.geometry.y,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel:struts
	{
		right = dpi(35)
	}

	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end
	)

	local layout_box 		= require('widget.layoutbox')(s)
    local add_button 		= require('widget.open-default-app')(s)

panel : setup {
		layout = wibox.layout.align.vertical,
		expand = 'none',
		{
			layout = wibox.layout.fixed.vertical,
            spacing = dpi(1),
			layout_box,
            tag_list2(s),
            add_button
			
		},
		nil, 
		{
			layout = wibox.layout.fixed.vertical,
		--	spacing = dpi(1),
            task_list2(s)            
		}
	}

	return panel
    
    
end


return side_panel
