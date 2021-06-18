local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')

local top_panel = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(40)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(40),
		width = s.geometry.width - offsetx,
		x = s.geometry.x + offsetx,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel:struts
	{
		top = dpi(40)
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

	s.systray = wibox.widget {
		visible = false,
		base_size = dpi(20),
		horizontal = true,
		screen = 'primary',
		widget = wibox.widget.systray
	}

	local clock 			= require('widget.clock')(s)
	local layout_box 		= require('widget.layoutbox')(s)
	local add_button 		= require('widget.open-default-app')(s)
	s.tray_toggler  		= require('widget.tray-toggle')
	s.updater 				= require('widget.package-updater')()
	local todo_widget 		= require("widget.todo-widget.todo")
	local volume_widget 	= require('widget.volume-widget.volume')
--	s.screen_rec 			= require('widget.screen-recorder')()
	--s.mpd       			= require('widget.mpd')()
	--s.bluetooth   			= require('widget.bluetooth')()
--	s.battery     			= require('widget.battery')()
	s.network       		= require('widget.network')()
	s.info_center_toggle	= require('widget.info-center-toggle')()
	--local mpris_widget 		= require("widget.mpris-widget")

	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = 'none',
		{
			layout = wibox.layout.fixed.horizontal,
			task_list(s),
			add_button
		},
		nil, 
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(5),
			{
				s.systray,
				left = dpi(5),
				right = dpi(5),
				top = dpi(12),
				bottom = dpi(12),
				widget = wibox.container.margin
			},
			s.tray_toggler,
			--s.screen_rec,
			--s.mpd,
			--s.bluetooth,
			--s.battery,
			--mpris_widget,
			volume_widget{
				widget_type = 'arc'
			},
			todo_widget(),
			s.updater,
			s.network,
			clock,
			layout_box,
			s.info_center_toggle
		}
	}

	return panel
end


return top_panel
