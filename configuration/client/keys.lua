local awful = require('awful')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
require('awful.autofocus')
local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key

local client_keys = awful.util.table.join(
	awful.key(
		{modkey},
		'f',
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = 'Client'}
	),
	awful.key(
		{modkey},
		'q',
		function(c)
			c:kill()
		end,
		{description = 'close', group = 'Client'}
	),
	-- awful.key(
	-- 	{altkey, 'Control'},
	-- 	'd',
	-- 	function()
	-- 		awful.client.focus.byidx(1)
	-- 	end,
	-- 	{description = 'focus next by index', group = 'Client'}
	-- ),
	-- Moving windows between positions works between desktops
 	awful.key(
		{ modkey, "Shift"   },
		"Left",
		function (c)
			awful.client.swap.global_bydirection("left")
			c:raise()
  		end,
  		{description = "swap with left client", group = "Client"}
	),
  	awful.key(
		{ modkey, "Shift"   },
		"Right",
		function (c)
			awful.client.swap.global_bydirection("right")
			c:raise()
  		end,
  		{description = "swap with right client", group = "Client"}
	),
  	awful.key(
		{ modkey, "Shift"   }, 
		"Down", 
		function (c)
			awful.client.swap.global_bydirection("down")
			c:raise()
  		end,
  		{description = "swap with down client", group = "Client"}
	),
  	awful.key(
		{ modkey, "Shift"   }, 
		"Up", 
		function (c)
			awful.client.swap.global_bydirection("up")
			c:raise()
  		end,
  		{description = "swap with up client", group = "Client"}
	),
	 -- Moving window focus works between desktops
	 awful.key(
		{ modkey}, 
	 	"Down", 
		function (c)
			awful.client.focus.global_bydirection("down")
			c:lower()
	  	end,
	  	{description = "focus next window up", group = "Client"}
	),
	  awful.key(
		{modkey}, 
		"Up", 
		function (c)
			awful.client.focus.global_bydirection("up")
			c:lower()
	  	end,
	  	{description = "focus next window down", group = "Client"}
	),
	  awful.key(
		{ modkey}, 
		"Right", 
		function (c)
			awful.client.focus.global_bydirection("right")
			c:lower()
	  	end,
	  	{description = "focus next window right", group = "Client"}
	),
	  awful.key(
		{modkey}, 
		"Left", 
		function (c)
			awful.client.focus.global_bydirection("left")
			c:lower()
	  	end,
	  	{description = "focus next window left", group = "Client"}
	),
	-- awful.key(
	-- 	{altkey, 'Control'},
	-- 	'a',
	-- 	function()
	-- 		awful.client.focus.byidx(-1)
	-- 	end,
	-- 	{description = 'focus previous by index', group = "Client"}
	-- ),
	-- awful.key(
	-- 	{ modkey, 'Shift'  },
	-- 	'd',
	-- 	function ()
	-- 		awful.client.swap.byidx(1)
	-- 	end,
	-- 	{description = 'swap with next client by index', group = "Client"}
	-- ),
	-- awful.key(
	-- 	{ modkey, 'Shift' },
	-- 	'a',
	-- 	function ()
	-- 		awful.client.swap.byidx(-1)
	-- 	end,
	-- 	{description = 'swap with next client by index', group = "Client"}
	-- ),
	awful.key(
		{modkey}, 
		'u', 
		awful.client.urgent.jumpto, 
		{description = 'jump to urgent client', group = "Client"}
	),
	awful.key(
		{altkey},
		'Tab',
		function()
			--awful.client.focus.history.previous()
			awful.client.focus.byidx(1)
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = 'Switch windows', group = "Client"}
	),
    awful.key(
        {modkey}, 
        "Tab", 
        function() awful.spawn.with_shell('rofi -show window') end,
        {description = 'Active Windows', group = "Client"}
    ),  
    awful.key(
        {modkey},
        'n',
        function(c)
            c.minimized = true
        end,
        {description = 'minimize client', group = "Client"}
    ),
	awful.key(
		{ modkey, 'Shift' }, 
		'c', 
		function(c)
			local focused = awful.screen.focused()

			awful.placement.centered(c, {
				honor_workarea = true
			})
		end,
		{description = 'align a client to the center of the focused screen', group = "Client"}
	),
	awful.key(
		{modkey},
		'c',
		function(c)
			c.fullscreen = false
			c.maximized = false
			c.floating = not c.floating
			c:raise()
		end,
		{description = 'toggle floating', group = "Client"}
	),
	awful.key(
		{altkey, 'Control'},
		'Right',
		function()
			awful.client.focus.byidx(1)
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = 'Give focus to next window', group = "Client"}
	),
	awful.key(
		{altkey, 'Control'},
		'Left',
		function()
			awful.client.focus.byidx(-1)
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = 'Give focus to previous window', group = "Client"}
	),
	-- Move client to tag below
	awful.key(
		{modkey, 'Control'},
		'Down',
		function()
			if client.focus then
				-- get current tag
				local t = client.focus and client.focus.first_tag or nil
				if t == nil then
					return
				end
				-- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
				local tag = client.focus.screen.tags[(t.name % 9) + 1]
				awful.client.movetotag(tag)
				awful.tag.viewnext()
			end
		end,
		{description = 'Move client to tag below', group = "Client"},
		descr_move
	),
	-- Move client to tag above
	awful.key(
		{modkey, 'Control'},
		'Up',
		function()
			if client.focus then
				-- get current tag
				local t = client.focus and client.focus.first_tag or nil
				if t == nil then
					return
				end
				-- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
				local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
				awful.client.movetotag(tag)
				awful.tag.viewprev()
			end
		end,
		{description = 'Move client to tag above', group = "Client"},
		descr_move
	),
	-- -- Move client tab to the right
	-- awful.key(
	-- 	{ modkey, 'Shift'  },
	-- 	'Right',
	-- 	function ()
	-- 		awful.client.swap.byidx(1)
	-- 	end,
	-- 	{description = 'swap with next client by index', group = "Client"}
	-- ),
	-- -- Move client tab to the left
	-- awful.key(
	-- 	{ modkey, 'Shift' },
	-- 	'Left',
	-- 	function ()
	-- 		awful.client.swap.byidx(-1)
	-- 	end,
	-- 	{description = 'swap with next client by index', group = "Client"}
	-- ),
	-- Screen management
	awful.key(
		{modkey},
		'o',
		function()
			client.focus:move_to_screen()
		end,
		{description = 'Move client to next screen', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Up',
		function(c)
			c:relative_move(0, dpi(-10), 0, 0)
		end,
		{description = 'move floating client up by 10 px', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Down',
		function(c)
			c:relative_move(0, dpi(10), 0, 0)
		end,
		{description = 'move floating client down by 10 px', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Left',
		function(c)
			c:relative_move(dpi(-10), 0, 0, 0)
		end,
		{description = 'move floating client to the left by 10 px', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Right',
		function(c)
			c:relative_move(dpi(10), 0, 0, 0)
		end,
		{description = 'move floating client to the right by 10 px', group = "Client"}
	),
	awful.key(
		{modkey, 'Control', 'Shift'},
		'Up',
		function(c)
			c:relative_move(0, dpi(-10), 0, dpi(10))
		end,
		{description = 'increase floating client size vertically by 10 px up', group = "Client"}
	),
	awful.key(
		{modkey, 'Control', 'Shift'},
		'Down',
		function(c)
			c:relative_move(0, 0, 0, dpi(10))
		end,
		{description = 'increase floating client size vertically by 10 px down', group = "Client"}
	),
	awful.key(
		{modkey, 'Control', 'Shift'},
		'Left',
		function(c)
			c:relative_move(dpi(-10), 0, dpi(10), 0)
		end,
		{description = 'increase floating client size horizontally by 10 px left', group = "Client"}
	),
	awful.key(
		{modkey, 'Control', 'Shift'},
		'Right',
		function(c)
			c:relative_move(0, 0, dpi(10), 0)
		end,
		{description = 'increase floating client size horizontally by 10 px right', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Up',
		function(c)
			if c.height > 10 then
				c:relative_move(0, 0, 0, dpi(-10))
			end
		end,
		{description = 'decrease floating client size vertically by 10 px up', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Down',
		function(c)
			local c_height = c.height
			c:relative_move(0, 0, 0, dpi(-10))
			if c.height ~= c_height and c.height > 10 then
				c:relative_move(0, dpi(10), 0, 0)
			end
		end,
		{description = 'decrease floating client size vertically by 10 px down', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Left',
		function(c)
			if c.width > 10 then
				c:relative_move(0, 0, dpi(-10), 0)
			end
		end,
		{description = 'decrease floating client size horizontally by 10 px left', group = "Client"}
	),
	awful.key(
		{modkey, 'Control'},
		'Right',
		function(c)
			local c_width = c.width
			c:relative_move(0, 0, dpi(-10), 0)
			if c.width ~= c_width and c.width > 10 then
				c:relative_move(dpi(10), 0 , 0, 0)
			end
		end,
		{description = 'decrease floating client size horizontally by 10 px right', group = "Client"}
	)
)

return client_keys
