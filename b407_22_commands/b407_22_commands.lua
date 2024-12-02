------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) Custom Commands Creation -------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Find Custom DATAREFS
dr_show_tablet 								= find_dataref("jrxDR/407/configuration/options/show_tablet")
dr_menu_button_1 							= find_dataref("jrxDR/407/configuration/options/menu_butt_1")
dr_menu_button_2 							= find_dataref("jrxDR/407/configuration/options/menu_butt_2")
dr_menu_button_3 							= find_dataref("jrxDR/407/configuration/options/menu_butt_3")
dr_menu_button_4 							= find_dataref("jrxDR/407/configuration/options/menu_butt_4")
dr_menu_button_5 							= find_dataref("jrxDR/407/configuration/options/menu_butt_5")
dr_dav_lower_mode							= find_dataref("jrxDR/407/davtron_gauge/mode_cycle")
dr_dav_upper_mode							= find_dataref("jrxDR/407/davtron_gauge/mode_u_cycle")
dr_startup_sw								= find_dataref("jrxDR/407/collective/switches/starter")
dr_horn_mute								= find_dataref("jrxDR/407/panels/switches/horn_mute")
dr_landing_light_switch						= find_dataref("jrxDR/407/panels/switches/landing_lights")
dr_lighting_exterior_search_light_l_r 		= find_dataref("jrxDR/407/lighting/exterior/search_light_left_right")
dr_lighting_exterior_search_light_u_d 		= find_dataref("jrxDR/407/lighting/exterior/search_light_up_down")
dr_lighting_exterior_search_light_focus 	= find_dataref("jrxDR/407/lighting/exterior/search_light_focus")
dr_lighting_exterior_search_light_toggle 	= find_dataref("sim/cockpit2/switches/spot_light_on")
dr_lighting_exterior_strobe 				= find_dataref("sim/cockpit2/switches/strobe_lights_on")
dr_lighting_exterior_navigation 			= find_dataref("sim/cockpit2/switches/navigation_lights_on")
dr_lighting_exterior_beacon 				= find_dataref("sim/cockpit2/switches/beacon_on")
dr_lighting_exterior_pulse 					= find_dataref("jrxDR/407/lighting/exterior/pulse_lights_switch")
dr_lighting_exterior_logo 					= find_dataref("sim/cockpit2/switches/generic_lights_switch[3]")
dr_power									= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
dr_spot_light_power							= find_dataref("sim/cockpit2/switches/taxi_light_on")
dr_floats_options_floats					= find_dataref("jrxDR/407/configuration/options/floats")
dr_floats_armed								= find_dataref("jrxDR/407/overhead/switches/floats_armed")
dr_floats_cover_open						= find_dataref("jrxDR/407/overhead/switches/floats_cover")
dr_floats_inflate							= find_dataref("jrxDR/407/overhead/switches/floats_inflate")
-- Functions - Floats Cover
function toggle_float_cover_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_floats_cover_open == 0 then
			dr_floats_cover_open = 1
		else
			dr_floats_cover_open = 0
		end
	end
end
-- Functions - FLoat Inflate SW
function toggle_float_deploy_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_floats_options_floats == 2 then
			if dr_floats_armed == 1 then
				if dr_floats_cover_open == 1 then
					if dr_floats_inflate == 0 then
						dr_floats_inflate = 1
					else
						dr_floats_inflate = 0
					end
				end
			end
		end
	end
end
-- Functions - Strobe Light Switch Toggle
function cycle_strobe_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_strobe == 0 then
			dr_lighting_exterior_strobe = 1
		else
			dr_lighting_exterior_strobe = 0
		end
	end
end
-- Functions - Beacon Light Switch Toggle
function cycle_anti_col_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_beacon == 0 then
			dr_lighting_exterior_beacon = 1
		else
			dr_lighting_exterior_beacon = 0
		end
	end
end
-- Functions - Nav Light Switch Toggle
function cycle_nav_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_navigation == 0 then
			dr_lighting_exterior_navigation = 1
		else
			dr_lighting_exterior_navigation = 0
		end
	end
end
-- Functions - Pulse Light Switch Toggle
function cycle_pulse_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_pulse == 0 then
			dr_lighting_exterior_pulse = 1
		else
			dr_lighting_exterior_pulse = 0
		end
	end
end
-- Functions - Logo Light Switch Toggle
function cycle_logo_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_logo == 0 then
			dr_lighting_exterior_logo = 1
		else
			dr_lighting_exterior_logo = 0
		end
	end
end
-- Functions - Search Light Switch Toggle
function cycle_search_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_lighting_exterior_search_light_toggle == 0 then
			dr_lighting_exterior_search_light_toggle= 1
		else
			dr_lighting_exterior_search_light_toggle = 0
		end
	end
end
-- Functions - Landing Light Switch Toggle
function cycle_landing_light_sw_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_landing_light_switch == 0 then
			dr_landing_light_switch = 1
		elseif dr_landing_light_switch == 1 then
			dr_landing_light_switch = 2
		elseif dr_landing_light_switch == 2 then
			dr_landing_light_switch = 0
		end
	end
end
-- Functions - Davtron Gauge Cycle
function cycle_davtron_upper_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_dav_upper_mode == 0 then
			dr_dav_upper_mode = 1
		elseif dr_dav_upper_mode == 1 then
			dr_dav_upper_mode = 2
		elseif dr_dav_upper_mode == 2 then
			dr_dav_upper_mode = 0
		end
	end
end
function cycle_davtron_lower_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_dav_lower_mode == 0 then
			dr_dav_lower_mode = 1
		elseif dr_dav_lower_mode == 1 then
			dr_dav_lower_mode = 2
		elseif dr_dav_lower_mode == 2 then
			dr_dav_lower_mode = 3
		elseif dr_dav_lower_mode == 3 then
			dr_dav_lower_mode = 0
		end
	end
end
-- Tablet Menu Buttons
function show_tablet_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 0 then
			dr_show_tablet = 2
	else
			dr_show_tablet = 0
		end
	end
end
function show_menu_page_1_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 2 then
			if dr_menu_button_1 == 0 then
				dr_menu_button_1 = 2
				dr_menu_button_2 = 0
				dr_menu_button_3 = 0
				dr_menu_button_4 = 0
				dr_menu_button_5 = 0
			end
		end
	end	
end
function show_menu_page_2_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 2 then
			if dr_menu_button_2 == 0 then
				dr_menu_button_1 = 0
				dr_menu_button_2 = 2
				dr_menu_button_3 = 0
				dr_menu_button_4 = 0
				dr_menu_button_5 = 0
			end
		end
	end	
end
function show_menu_page_3_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 2 then
			if dr_menu_button_3 == 0 then
				dr_menu_button_1 = 0
				dr_menu_button_2 = 0
				dr_menu_button_3 = 2
				dr_menu_button_4 = 0
				dr_menu_button_5 = 0
			end
		end
	end	
end
function show_menu_page_4_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 2 then
			if dr_menu_button_4 == 0 then
				dr_menu_button_1 = 0
				dr_menu_button_2 = 0
				dr_menu_button_3 = 0
				dr_menu_button_4 = 2
				dr_menu_button_5 = 0
			end
		end
	end	
end
function show_menu_page_5_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_show_tablet == 2 then
			if dr_menu_button_5 == 0 then
				dr_menu_button_1 = 0
				dr_menu_button_2 = 0
				dr_menu_button_3 = 0
				dr_menu_button_4 = 0
				dr_menu_button_5 = 2
			end
		end
	end	
end
-- Command Search Light - Focus - IN
function b407_search_light_f_in_CMDhandler(phase, duration)
local b407_search_light_f_i = 1
	if phase == 2 then
		if dr_power >= 10 then
				dr_lighting_exterior_search_light_focus = dr_lighting_exterior_search_light_focus + b407_search_light_f_i
			if dr_lighting_exterior_search_light_focus >= 10 then
				dr_lighting_exterior_search_light_focus = 10
			end
		end
	end
end
run_at_interval(b407_search_light_f_in_CMDhandler, 0)
-- Command Search Light - Focus - OUT
function b407_search_light_f_out_CMDhandler(phase, duration)
local b407_search_light_f_o = 1
	if phase == 2 then
		if dr_power >= 10 then
				dr_lighting_exterior_search_light_focus = dr_lighting_exterior_search_light_focus - b407_search_light_f_o
			if dr_lighting_exterior_search_light_focus <= 0 then
				dr_lighting_exterior_search_light_focus = 0
			end
		end
	end
end
run_at_interval(b407_search_light_f_out_CMDhandler, 0)
-- Command Search Light - Right
function b407_search_light_r_CMDhandler(phase, duration)
local b407_search_light_r = 0.0025
  if phase == 1 then
	if dr_power >= 10 then
		dr_lighting_exterior_search_light_l_r = dr_lighting_exterior_search_light_l_r + b407_search_light_r
    end
  end
end
run_at_interval(b407_search_light_r_CMDhandler, 0)
-- Command Search Light - Left
function b407_search_light_l_CMDhandler(phase, duration)
local b407_search_light_l = 0.0025
  if phase == 1 then
	if dr_power >= 10 then
		dr_lighting_exterior_search_light_l_r = dr_lighting_exterior_search_light_l_r - b407_search_light_l
    end
  end
end
run_at_interval(b407_search_light_l_CMDhandler, 0)
-- Command Search Light - Down
function b407_search_light_d_CMDhandler(phase, duration)
local b407_search_light_d = 0.0025
  if phase == 1 then
	if dr_power >= 10 then
		dr_lighting_exterior_search_light_u_d = dr_lighting_exterior_search_light_u_d + b407_search_light_d
		if dr_lighting_exterior_search_light_u_d >= 1.0 then
			dr_lighting_exterior_search_light_u_d = 1.0
		end
    end
  end
end
run_at_interval(b407_search_light_d_CMDhandler, 0)
-- Command Search Light - Up
function b407_search_light_u_CMDhandler(phase, duration)
local b407_search_light_u = - 0.0025
  if phase == 1 then
	if dr_power >= 10 then
		dr_lighting_exterior_search_light_u_d = dr_lighting_exterior_search_light_u_d + b407_search_light_u
		if dr_lighting_exterior_search_light_u_d <= 0.0 then
			dr_lighting_exterior_search_light_u_d = 0.0
		end
    end
  end
end
run_at_interval(b407_search_light_u_CMDhandler, 0)
-- Collective Starter Switch
function collective_starter_sw_CMDhandler(phase, duration)
	if phase == 1 then
		if dr_startup_sw == 0 then
			dr_startup_sw = 1
		end
	end
	
	if phase == 2 then
		if dr_startup_sw == 1 then
			dr_startup_sw = 0
		end
	end
end
-- All Horns Mute
function horn_mute_sw_CMDhandler(phase, duration)
	if phase == 1 then
		if dr_horn_mute == 0 then
			dr_horn_mute = 1
		end
	end
		
		if phase == 2 then
			if dr_horn_mute == 1 then
			dr_horn_mute = 0
			end
		end
end
-- Floats Cover Open
b407_floats_cover			= create_command("407/Switches/Controls/floats_deploy_cover", "JRX B407 - Switch - Floats - Cover", toggle_float_cover_CMDhandler)
-- Floats Deploy
b407_floats_deploy			= create_command("407/Switches/Controls/floats_deploy", "JRX B407 - Switch - Deploy Floats", toggle_float_deploy_CMDhandler)
-- Horn Mute Button
b407_horn_mute				= create_command("407/Switches/Controls/horn_mute", "JRX B407 - Switch - Horn Mute", horn_mute_sw_CMDhandler)
-- Starter Switch
b407_starter_switch			= create_command("407/Switches/Controls/starter_switch", "JRX B407 - Switch - Starter", collective_starter_sw_CMDhandler)
-- Davtron Gauge Functions
b407_dav_upper				= create_command("407/Switches/Controls/dav_upper", "JRX B407 - Switch - Davtron OAT / TEMP Mode", cycle_davtron_upper_CMDhandler)
b407_dav_lower				= create_command("407/Switches/Controls/dav_lower", "JRX B407 - Switch - Davtron Mode Cycle", cycle_davtron_lower_CMDhandler)
-- Menu Buttons GTN TAB
b407_menu_show_tab			= create_command("407/Switches/Controls/menu_button_0", "JRX B407 - Switch - Show Tablet", show_tablet_CMDhandler)
b407_menu_button_1			= create_command("407/Switches/Controls/menu_button_1", "JRX B407 - Switch - Tablet Menu Page 1", show_menu_page_1_CMDhandler)
b407_menu_button_2			= create_command("407/Switches/Controls/menu_button_2", "JRX B407 - Switch - Tablet Menu Page 2", show_menu_page_2_CMDhandler)
b407_menu_button_3			= create_command("407/Switches/Controls/menu_button_3", "JRX B407 - Switch - Tablet Menu Page 3", show_menu_page_3_CMDhandler)
b407_menu_button_4			= create_command("407/Switches/Controls/menu_button_4", "JRX B407 - Switch - Tablet Menu Page 4", show_menu_page_4_CMDhandler)
b407_menu_button_5			= create_command("407/Switches/Controls/menu_button_5", "JRX B407 - Switch - Tablet Menu Page 5", show_menu_page_5_CMDhandler)
-- Exterior lighting
b407_landing_light_sw		= create_command("407/Switches/Controls/exterior_lighting_0", "JRX B407 - External Lights - Landing Lights - ON / OFF", cycle_landing_light_sw_CMDhandler)
b407_strobe_light_sw		= create_command("407/Switches/Controls/exterior_lighting_1", "JRX B407 - External Lights - Strobe Lights - ON / OFF", cycle_strobe_light_sw_CMDhandler)
b407_anti_col_light_sw		= create_command("407/Switches/Controls/exterior_lighting_2", "JRX B407 - External Lights - Anti Collision Lights - ON / OFF", cycle_anti_col_light_sw_CMDhandler)
b407_navigation_light_sw	= create_command("407/Switches/Controls/exterior_lighting_3", "JRX B407 - External Lights - Navigation Lights - ON / OFF", cycle_nav_light_sw_CMDhandler)
b407_pulse_light_sw			= create_command("407/Switches/Controls/exterior_lighting_4", "JRX B407 - External Lights - Pulse Lights - ON / OFF", cycle_pulse_light_sw_CMDhandler)
b407_logo_light_sw			= create_command("407/Switches/Controls/exterior_lighting_5", "JRX B407 - External Lights - Logo Lights - ON / OFF", cycle_logo_light_sw_CMDhandler)
b407_search_light_sw		= create_command("407/Switches/Controls/exterior_lighting_6", "JRX B407 - External Lights - Search Light - ON / OFF", cycle_search_light_sw_CMDhandler)
b407_sl_l					= create_command("407/Switches/Controls/exterior_lighting_7", "JRX B407 - External Lights - Search Light - Left ←", b407_search_light_l_CMDhandler)
b407_sl_r					= create_command("407/Switches/Controls/exterior_lighting_8", "JRX B407 - External Lights - Search Light - Right →", b407_search_light_r_CMDhandler)
b407_sl_d					= create_command("407/Switches/Controls/exterior_lighting_9", "JRX B407 - External Lights - Search Light - Down ↓", b407_search_light_d_CMDhandler)
b407_sl_u					= create_command("407/Switches/Controls/exterior_lighting_9a", "JRX B407 - External Lights - Search Light - Up ↑", b407_search_light_u_CMDhandler)
b407_sl_f_in				= create_command("407/Switches/Controls/exterior_lighting_9b", "JRX B407 - External Lights - Search Light - Focus In → ←", b407_search_light_f_in_CMDhandler)
b407_sl_f_out				= create_command("407/Switches/Controls/exterior_lighting_9c", "JRX B407 - External Lights - Search Light - Focus Out ← →", b407_search_light_f_out_CMDhandler)