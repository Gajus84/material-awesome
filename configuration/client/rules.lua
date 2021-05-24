local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local beautiful = require('beautiful')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
	'request::rules',
	function()
		-- All clients will match this rule.
		ruled.client.append_rule {
			id = 'global',
			rule = {},
			properties = {
				focus = awful.client.focus.filter,
				raise = true,
				floating = false,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				maximized_horizontal = false,
				maximized_vertical = false,
				keys = client_keys,
				buttons = client_buttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen
			}
		}

		ruled.client.append_rule {
			id = 'round_clients',
			rule_any = {
				type = {
					'normal',
					'dialog'
				}
			},
			except_any  = {
				name = {'Discord Updater'}
			},
			properties = {
				round_corners = true,
				shape = beautiful.client_shape_rounded
			}
		}

		-- Titlebar rules
		ruled.client.append_rule {
			id 	= 'titlebars',
			rule_any = {
				type = {
					--'normal',
					'dialog',
					'modal',
					'utility'
				}
			},
			properties = {
				titlebars_enabled = true
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id = 'dialog',
			rule_any = {
				type  = {'dialog'},
				class = {
					'Wicd-client.py',
					'calendar.google.com'
				}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Modals
		ruled.client.append_rule {
			id = 'modal',
			rule_any = {
				type = {'modal'}
			},
			properties = {
				titlebars_enabled = false,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

        -- Albert
		ruled.client.append_rule {
			id = 'modal',
			rule_any = {
				class = {'albert'}
			},
			properties = {
				titlebars_enabled = false,
				floating = true,
				above = true,
				skip_decoration = true,
                border_width = 0,
				placement = awful.placement.top
			}
		}

		-- Splash
		ruled.client.append_rule {
			id = 'splash',
			rule_any = {
				type = {'splash'},
				name = {'Discord Updater'}
			},
			properties = {
				titlebars_enabled = false,
				round_corners = false,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Quake Terminal
		ruled.client.append_rule {
			id = 'terminals',
			rule_any = {
				name = {
                    'QuakeTerminal'
				}
			},
			properties = {
				-- Make the window floating
				floating = true,

				-- Make the window stick to ALL tags/workspaces (this is what lets you toggle it on all tags)
				sticky = true
			}
		}

		-- Floating windows
		ruled.client.append_rule {
			id = 'floatingwindows',
			rule_any = {
				class = {
					'scrcpy'
				}
			},
			properties = {
				-- Make the window floating
				floating = true
			}
		}

		-- Custom Floats
		ruled.client.append_rule {
			id = 'customfloats',
			rule_any = {
				class = {
					'SiriKali',
					'KeePassXC',
					'Qalculate-gtk',
                    'Signal',
					'opensnitch-ui',
					'Gufw.py'
				}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered,
				sticky = true
			}
		}    
		-- Ranger
		ruled.client.append_rule {
			id = 'ranger',
			rule_any = {
				instance = {'ranger'}
			},
			properties = {
				tag = '3',
				screen = 2
			}
		}
		-- Browsers and chats
		ruled.client.append_rule {
			id = 'internet',
			rule_any = {
				class = {
					'firefox',
					'Tor Browser',
					'discord',
					'Chromium',
					'Google-chrome',
					'LibreWolf'
				}
			},
			properties = {
				tag = '1'
			}
		}
    -- Terminal emulators
		ruled.client.append_rule {
			id = 'terminal',
			rule_any = {
				class = {
					'URxvt',
					'XTerm',
					'UXTerm',
					'kitty',
					'K3rmit',
					--'Alacritty',
                    'Pamac-manager'
				}
			},
			properties = {
				switch_to_tags = true,
				size_hints_honor = false,
				titlebars_enabled = false
			}
		}  
    -- Code
		ruled.client.append_rule {
			id = 'code',
			rule_any = {
				class = {
					'kate',
					'featherpad',
					'VSCodium',
					'looking-glass-client',
					'Virt-manager'
				}
			},
			properties = {
				tag = '5',
				switch_to_tags = true
			}
		}  

        -- Sandbox
		ruled.client.append_rule {
			id = 'sandbox',
			rule_any = {
				class = {
				
				}
			},
			properties = {
				tag = '7',
			--	switch_to_tags = true
			}
		}
		-- Multimedia
		ruled.client.append_rule {
			id = 'multimedia',
			rule_any = {
				class = {
					'vlc',
					'mpv'
				}
			},
			properties = {
                tag = '2',
                screen = 2,
				kmaswitch_to_tags = true,
			--	placement = awful.placement.centered,
                titlebars_enabled = true,
                switch_to_tags = true
			}
		}

		-- Gaming
		ruled.client.append_rule {
			id = 'gaming',
			rule_any = {
				class = {
					'dolphin-emu',
					'Steam',
					'Lutris',
					'Citra',
					'supertuxkart',
					'Moonlight'
				},
				name = {
					'Steam',
					'Lutris',
					'Moonlight'
				}
			},
			properties = {
				tag = '6',
				skip_decoration = true,
				switch_to_tags = true,
                titlebars_enabled = false,
				
				-- Place the window in the center if the tag is set to floating mode
				placement = awful.placement.centered
			}
		}

		-- Mail Apps
		ruled.client.append_rule {
			id = 'mail',
			rule_any = {
				class = {
					'Thunderbird',
					'tutanota-desktop'
				}
			},
			properties = {
				tag = '9',
				skip_decoration = true
			}
		}
        -- Files
		ruled.client.append_rule {
			id = 'files',
			rule_any = {
				class = {
					'krusader',
					'Doublecmd'
				}
			},
			properties = {
				tag = '3',
                screen = 1,
			--	switch_to_tags = true
			}
		}
    	-- Floating
		ruled.client.append_rule {
			id       = 'floating',
			rule_any = {
				instance    = {
					'file_progress',
					'Popup',
					'nm-connection-editor',
				},
				class = {
					'scrcpy',
					'Mugshot',
					'Pulseeffects'
				},
				role    = {
					'AlarmWindow',
					'ConfigManager',
					'pop-up',
                    'Popup'       
				}
			},
			properties = {
				titlebars_enabled = true,
				skip_decoration = true,
				ontop = true,
				floating = true,
				focus = awful.client.focus.filter,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				placement = awful.placement.centered
			}
		}
		-- Graphics Editing
		ruled.client.append_rule {
			id = 'graphics',
			rule_any = {
				class = {
					'Gimp',
					'Inkscape',
					'Flowblade'
				}
			},
			properties = {
				tag = '8',
				switch_to_tags = true
			}
		}
	end
)

-- Normally we'd do this with a rule, but some programs like spotify doesn't set its class or name
-- until after it starts up, so we need to catch that signal.
client.connect_signal(
	'property::class',
	function(c)
		if c.class == 'Spotify' then
			local window_mode = false

			-- Check if fullscreen or window mode
			if c.fullscreen then
				window_mode = false
				c.fullscreen = false
			else
				window_mode = true
			end

			-- Check if Spotify is already open
			local app = function (c)
				return ruled.client.match(c, {class = 'Spotify'})
			end

			local app_count = 0
			for c in awful.client.iterate(app) do
				app_count = app_count + 1
			end

			-- If Spotify is already open, don't open a new instance
			if app_count > 1 then
				c:kill()
				-- Switch to previous instance
				for c in awful.client.iterate(app) do
					c:jump_to(false)
				end
			else
				-- Move the instance to specified tag on this screen
				local t = awful.tag.find_by_name(awful.screen.focused(), '5')
				c:move_to_tag(t)
				t:view_only()

				-- Fullscreen mode if not window mode
				if not window_mode then
					c.fullscreen = true
				else
					c.floating = true
					awful.placement.centered(c, {honor_workarea = true})
				end
			end
		end
	end
)
