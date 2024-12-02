------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) Fuel / Weights Creation and Commands--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Weights In Pounds
local b407_weight_1 =  0   	--- Pilot
local b407_weight_2 =  0   	--- Copilot
local b407_weight_3 =  0    --- Doors
local b407_weight_5 =  0    --- RBF
local b407_weight_6 =  0   	--- Pax
local b407_weight_7 =  0    --- Search Light
local b407_weight_8 =  0    --- Autopilot Unit
local b407_weight_9 =  0    --- Flight Controls
local b407_weight_10 = 0   	--- Wire Cutters
local b407_weight_11 = 0   	--- Emergency Floats
local b407_weight_12 = 0	--- Weight trim - 10
local b407_weight_13 = 0	--- Weight trim + 10
local b407_weight_14 = 0	--- Weight Trim - 100
local b407_weight_15 = 0	--- Weight Trim + 100
local b407_weight_16 = 0	--- Payload Additional Weight
local b407_weight_17 = 0	--- Bear Paws
local b407_weight_18 = 0	--- Camera System
local b407_weight_m	 = 0	--- Aircraft Empty Weight from XP
local b407_weight_f	 = 0	--- Aircraft total Fuel from XP
local b407_auw		 = 0	--- Use for weight conversions
-- Find Custom Datarefs - Totals
dr_menu_2_fuel_weight_tot_lbs	= find_dataref("jrxDR/407/configuration/options/fuel_Weight_total_lbs")		-- FUEL WEIGHT DISPLAY
dr_menu_2_auw_tot_lbs			= find_dataref("jrxDR/407/configuration/options/auw_Weight_total_lbs")		-- AU WEIGHT TOTAL DISPLAY
dr_menu_2_payload_tot_lbs		= find_dataref("jrxDR/407/configuration/options/payload_Weight_total_lbs")	-- ADDITIONAL PAYLOAD WEIGHT DISPLAYED
dr_menu_2_crew_tot_lbs			= find_dataref("jrxDR/407/configuration/options/crew_Weight_total_lbs")		-- CREW WEIGHT DISPLAY
dr_menu_2_config_tot_lbs		= find_dataref("jrxDR/407/configuration/options/options_Weight_total_lbs")	-- OPTIONS WEIGHT DISPLAY
-- Find Custom Datarefs - Options
dr_menu_2_options_copilot		= find_dataref("jrxDR/407/configuration/options/copilot")
dr_menu_2_options_doors			= find_dataref("jrxDR/407/configuration/options/doors")
--dr_menu_2_options_cargo
dr_menu_2_options_rbf			= find_dataref("jrxDR/407/configuration/options/remove_before_flight")
dr_menu_2_options_Pax			= find_dataref("jrxDR/407/configuration/options/pax")
dr_menu_2_options_s_light		= find_dataref("jrxDR/407/configuration/options/search_light")
dr_menu_2_options_ap_unit		= find_dataref("jrxDR/407/configuration/options/autopilot_unit")
dr_menu_2_options_dual_fc		= find_dataref("jrxDR/407/configuration/options/dual_FC")
dr_menu_2_options_emer_floats	= find_dataref("jrxDR/407/configuration/options/floats")
dr_menu_2_options_wire_cutters	= find_dataref("jrxDR/407/configuration/options/wire_cutters")
dr_menu_2_options_panel_type	= find_dataref("jrxDR/407/configuration/options/alternate_panels")
dr_menu_2_options_bear_paws		= find_dataref("jrxDR/407/configuration/options/bear_paws")
dr_menu_2_options_camera    	=find_dataref("jrxDR/407/overhead/switches/tb")
-- Find Standard Datarefs
dr_door_switch_0	= find_dataref("sim/cockpit2/switches/door_open[0]")
dr_door_switch_1	= find_dataref("sim/cockpit2/switches/door_open[1]")
dr_door_switch_2	= find_dataref("sim/cockpit2/switches/door_open[2]")
dr_door_switch_3	= find_dataref("sim/cockpit2/switches/door_open[3]")
dr_door_switch_4	= find_dataref("sim/cockpit2/switches/door_open[4]")
dr_door_switch_5	= find_dataref("sim/cockpit2/switches/door_open[5]")
dr_door_switch_6	= find_dataref("sim/cockpit2/switches/door_open[6]")
dr_door_switch_7	= find_dataref("sim/cockpit2/switches/door_open[7]")
dr_door_switch_8	= find_dataref("sim/cockpit2/switches/door_open[8]")
dr_menu_2_fov					= find_dataref("sim/graphics/view/field_of_view_deg")
dr_menu_2_cog					= find_dataref("sim/flightmodel2/misc/cg_offset_z")
dr_menu_gear_on_ground 			= find_dataref("sim/cockpit2/tcas/targets/position/weight_on_wheels[0]")
dr_menu_total_payload_weight	= find_dataref("sim/flightmodel/weight/m_fixed")							-- TOTAL ALL OTHER WEIGHT
dr_menu_total_auw				= find_dataref("sim/flightmodel/weight/m_total")							-- TOTAL ALL UP WEIGHT
dr_menu_rotor_brake				= find_dataref("sim/cockpit2/switches/rotor_brake")
dr_menu_main_rotor_speed		= find_dataref("sim/cockpit2/engine/indicators/prop_speed_rpm[0]")
dr_menu_fuel_total_load_0		= find_dataref("sim/flightmodel/weight/m_fuel[0]")
dr_menu_fuel_total_load_1		= find_dataref("sim/flightmodel/weight/m_fuel[1]")
dr_menu_bus_volts_on			= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
dr_menu_empty_weight			= find_dataref("sim/aircraft/weight/acf_m_empty")
dr_menu_battery_on				= find_dataref("sim/cockpit2/electrical/battery_on[0]")
dr_menu_gpu_on					= find_dataref("sim/cockpit/electrical/gpu_on")
dr_airspeed_knots				= find_dataref("sim/cockpit2/gauges/indicators/airspeed_kts_pilot")
-- Find Custom Datarefs for other functions
dr_menu_1_options_crew_helmets	= find_dataref("jrxDR/407/configuration/options/helmet")
dr_menu_1_options_crew_headsets	= find_dataref("jrxDR/407/configuration/options/headset_hanging")
dr_menu_1_page_1				= find_dataref("jrxDR/407/configuration/options/menu_butt_1")
dr_menu_1_page_2				= find_dataref("jrxDR/407/configuration/options/menu_butt_2")
dr_menu_1_options_page_gtn		= find_dataref("jrxDR/407/configuration/options/menu_butt_3")
dr_menu_1_options_page_avitab	= find_dataref("jrxDR/407/configuration/options/menu_butt_4")
dr_menu_1_gpu					= find_dataref("jrxDR/407/configuration/options/gpu")
--
dr_options_headset_master_s_h	= find_dataref("jrxDR/407/configuration/options/headset_master_show_hide")

-- Crew Headsets Master / Show - Hide
function b407_set_crew_headsets_master_s_h_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_options_headset_master_s_h == 0 then
			dr_options_headset_master_s_h = 2
		else
			dr_options_headset_master_s_h = 0
		end
	end
end
b407_menu_master_headset_s_h = create_command("407/Menu/Configuration/22_just_hide_the_headsets", "JRX B407 - Menu - Just Hide Those Pesky Headsets", b407_set_crew_headsets_master_s_h_CMDhandler)
-- Hold the doors at speeds + 55 kts
function hold_doors_closed()
	if dr_menu_gear_on_ground == 0 then 
		if dr_airspeed_knots >= 55 then
			dr_door_switch_0	= 0
			dr_door_switch_1	= 0
			dr_door_switch_2	= 0
			dr_door_switch_3	= 0
			dr_door_switch_4	= 0
		else
			dr_door_switch_0	= dr_door_switch_0
			dr_door_switch_1	= dr_door_switch_1
			dr_door_switch_2	= dr_door_switch_2
			dr_door_switch_3	= dr_door_switch_3
			dr_door_switch_4	= dr_door_switch_4
		end
	end
end
-- Command Creation
-- Door Button
function b407_set_toggle_all_doors_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then		
			if dr_door_switch_0 == 0 and dr_door_switch_1 == 0 and dr_door_switch_2 == 0 and dr_door_switch_4 == 0 then
				dr_door_switch_0 = 1
				dr_door_switch_1 = 1
				dr_door_switch_2 = 1
				dr_door_switch_4 = 1
			elseif dr_door_switch_0 == 1 and dr_door_switch_1 == 1 and dr_door_switch_2 == 1 and dr_door_switch_4 == 1 then
				dr_door_switch_0 = 0
				dr_door_switch_1 = 0
				dr_door_switch_2 = 0
				dr_door_switch_4 = 0
			elseif dr_door_switch_0 == 1 and dr_door_switch_1 == 0 and dr_door_switch_2 == 0 and dr_door_switch_4 == 0 then
				dr_door_switch_0 = 0
				dr_door_switch_1 = 0
				dr_door_switch_2 = 0
				dr_door_switch_4 = 0
			elseif dr_door_switch_0 == 0 and dr_door_switch_1 == 1 and dr_door_switch_2 == 0 and dr_door_switch_4 == 0 then
				dr_door_switch_0 = 0
				dr_door_switch_1 = 0
				dr_door_switch_2 = 0
				dr_door_switch_4 = 0
			elseif dr_door_switch_0 == 0 and dr_door_switch_1 == 0 and dr_door_switch_2 == 1 and dr_door_switch_4 == 0 then
				dr_door_switch_0 = 0
				dr_door_switch_1 = 0
				dr_door_switch_2 = 0
				dr_door_switch_4 = 0
			elseif dr_door_switch_0 == 0 and dr_door_switch_1 == 0 and dr_door_switch_2 == 0 and dr_door_switch_4 == 1 then
				dr_door_switch_0 = 0
				dr_door_switch_1 = 0
				dr_door_switch_2 = 0
				dr_door_switch_4 = 0
			elseif dr_door_switch_0 == 0 and dr_door_switch_1 == 1 and dr_door_switch_2 == 1 and dr_door_switch_4 == 1 then
				dr_door_switch_0 = 1
				dr_door_switch_1 = 1
				dr_door_switch_2 = 1
				dr_door_switch_4 = 1
			elseif dr_door_switch_0 == 1 and dr_door_switch_1 == 0 and dr_door_switch_2 == 1 and dr_door_switch_4 == 1 then
				dr_door_switch_0 = 1
				dr_door_switch_1 = 1
				dr_door_switch_2 = 1
				dr_door_switch_4 = 1
			elseif dr_door_switch_0 == 1 and dr_door_switch_1 == 1 and dr_door_switch_2 == 0 and dr_door_switch_4 == 1 then
				dr_door_switch_0 = 1
				dr_door_switch_1 = 1
				dr_door_switch_2 = 1
				dr_door_switch_4 = 1
			elseif dr_door_switch_0 == 1 and dr_door_switch_1 == 1 and dr_door_switch_2 == 1 and dr_door_switch_4 == 0 then
				dr_door_switch_0 = 1
				dr_door_switch_1 = 1
				dr_door_switch_2 = 1
				dr_door_switch_4 = 1
			end
		end
	end
end
b407_menu_gpu = create_command("407/Switches/Controls/all_doors", "JRX B407 - Switch - Open Close All Doors", b407_set_toggle_all_doors_CMDhandler)
-- Logic for GPU
function b407_set_gpu_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_battery_on == 0 then		
				if dr_menu_1_gpu == 0 then
					dr_menu_1_gpu = 2
					dr_menu_gpu_on = 1
				else
					dr_menu_1_gpu = 0
					dr_menu_gpu_on = 0
				end
			end
		end
	end
end
b407_menu_gpu = create_command("407/Menu/Configuration/0_gpu", "JRX B407 - Menu - Toggle Ground Power Unit", b407_set_gpu_CMDhandler)
-- Crew Headsets
function b407_set_crew_headsets_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_1_options_crew_headsets == 0 then
			dr_menu_1_options_crew_headsets = 2
		else
			dr_menu_1_options_crew_headsets = 0
		end
	end
end
b407_menu_crew_headsets = create_command("407/Menu/Configuration/22_crew_headsets", "JRX B407 - Menu - Toggle Crew Headsets", b407_set_crew_headsets_CMDhandler)
-- Crew Helmets
function b407_set_crew_helmets_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_1_options_crew_helmets == 0 then
			dr_menu_1_options_crew_helmets = 2
		else
			dr_menu_1_options_crew_helmets = 0
		end
	end
end
b407_menu_crew_helmets = create_command("407/Menu/Configuration/21_crew_helmets", "JRX B407 - Menu - Toggle Crew Helmets", b407_set_crew_helmets_CMDhandler)
-- COG Plus
function b407_set_cog_plus_CMDhandler(phase, duration)
	if phase == 0 then
		dr_menu_2_cog = dr_menu_2_cog + 0.03
	end
end
b407_menu_cog_plus = create_command("407/Menu/Configuration/20_cog_plus", "JRX B407 - Menu - Set Center of Gravity +3 Cm", b407_set_cog_plus_CMDhandler)
-- COG Minus
function b407_set_cog_minus_CMDhandler(phase, duration)
	if phase == 0 then
		dr_menu_2_cog = dr_menu_2_cog - 0.03
	end
end
b407_menu_cog_minus = create_command("407/Menu/Configuration/19_cog_minus", "JRX B407 - Menu - Set Center of Gravity -3 Cm", b407_set_cog_minus_CMDhandler)
-- FOV Minus
function b407_set_fov_minus_CMDhandler(phase, duration)
	if phase == 0 then
		dr_menu_2_fov = dr_menu_2_fov - 5
	end
end
b407_menu_fov_minus = create_command("407/Menu/Configuration/18_fov_minus", "JRX B407 - Menu - Set Field of View -5°", b407_set_fov_minus_CMDhandler)
-- FOV Plus
function b407_set_fov_plus_CMDhandler(phase, duration)
	if phase == 0 then
			dr_menu_2_fov = dr_menu_2_fov + 5
	end
end
b407_menu_fov_plus = create_command("407/Menu/Configuration/17_fov_plus", "JRX B407 - Menu - Set Field of View +5°", b407_set_fov_plus_CMDhandler)
-- Fuel Load 25% -
function b407_set_fuel_load_25_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			dr_menu_fuel_total_load_0 = 0
			dr_menu_fuel_total_load_1 = 98.54
		end
	end
end
b407_menu_fuel_25 = create_command("407/Menu/Configuration/16_fuel_25", "JRX B407 - Menu - Set Fuel Load - 25%", b407_set_fuel_load_25_CMDhandler)
-- Fuel Load 50% -
function b407_set_fuel_load_50_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			dr_menu_fuel_total_load_0 = 78.79
			dr_menu_fuel_total_load_1 = 118.3
		end
	end
end
b407_menu_fuel_50 = create_command("407/Menu/Configuration/15_fuel_50", "JRX B407 - Menu - Set Fuel Load - 50%", b407_set_fuel_load_50_CMDhandler)
-- Fuel Load 75% -
function b407_set_fuel_load_75_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			dr_menu_fuel_total_load_0 = 177.33
			dr_menu_fuel_total_load_1 = 118.3
		end
	end
end
b407_menu_fuel_75 = create_command("407/Menu/Configuration/14_fuel_75", "JRX B407 - Menu - Set Fuel Load - 75%", b407_set_fuel_load_75_CMDhandler)
-- Fuel Load 100% -
function b407_set_fuel_load_100_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			dr_menu_fuel_total_load_0 = 275.9
			dr_menu_fuel_total_load_1 = 118.3
		end
	end
end
b407_menu_fuel_100 = create_command("407/Menu/Configuration/13_fuel_100", "JRX B407 - Menu - Set Fuel Load - 100%", b407_set_fuel_load_100_CMDhandler)
-- Weight Trim - 10
function b407_set_trim_minus_weight_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			b407_weight_12 = b407_weight_12 - 4.53592 * 2.204624446586247
		end
	end
end
b407_menu_weight_minus = create_command("407/Menu/Configuration/12a_weight_minus", "JRX B407 - Menu - Trim Payload Weight -10 lbs", b407_set_trim_minus_weight_CMDhandler)
-- Weight Trim + 10
function b407_set_trim_plus_weight_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			b407_weight_13 = b407_weight_13 + 4.53592 * 2.204624446586247
		end
	end
end
b407_menu_weight_plus = create_command("407/Menu/Configuration/12b_weight_plus", "JRX B407 - Menu - Trim Payload Weight +10 lbs", b407_set_trim_plus_weight_CMDhandler)
-- Weight Trim - 100
function b407_set_trim_minus_100_weight_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			b407_weight_14 = b407_weight_14 - 45.3592 * 2.204624446586247
		end
	end
end
b407_menu_weight_minus_100 = create_command("407/Menu/Configuration/12c_weight_minus", "JRX B407 - Menu - Trim Payload Weight -100 lbs", b407_set_trim_minus_100_weight_CMDhandler)
-- Weight Trim + 100
function b407_set_trim_plus_100_weight_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			b407_weight_15 = b407_weight_15 + 45.3592 * 2.204624446586247
		end
	end
end
b407_menu_weight_plus_100 = create_command("407/Menu/Configuration/12d_weight_plus", "JRX B407 - Menu - Trim Payload Weight +100 lbs", b407_set_trim_plus_100_weight_CMDhandler)
-- Emergency Floats
function b407_set_emer_floats_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_emer_floats == 0 then
				dr_menu_2_options_emer_floats = 2
			else
				dr_menu_2_options_emer_floats = 0
			end
		end
	end
end
b407_menu_emer_floats = create_command("407/Menu/Configuration/9_emer_floats", "JRX B407 - Menu - Toggle Emergency Floats", b407_set_emer_floats_CMDhandler)
-- Wire Cutters
function b407_set_wire_cutters_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_wire_cutters == 0 then
				dr_menu_2_options_wire_cutters = 2
			else
				dr_menu_2_options_wire_cutters = 0
			end
		end
	end
end
b407_menu_wire_cutters = create_command("407/Menu/Configuration/8_wire_cutters", "JRX B407 - Menu - Toggle Wire Cutters", b407_set_wire_cutters_CMDhandler)
-- Dual Flight Controls
function b407_set_dual_controls_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_dual_fc == 0 then
				dr_menu_2_options_dual_fc = 2
			else
				dr_menu_2_options_dual_fc = 0
			end
		end
	end
end
b407_menu_dual_fc = create_command("407/Menu/Configuration/7_dual_fc", "JRX B407 - Menu - Toggle Dual Flight Controls", b407_set_dual_controls_CMDhandler)
-- Autopilot Unit
function b407_set_ap_unit_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_ap_unit == 0 then
				dr_menu_2_options_ap_unit = 2
			else
				dr_menu_2_options_ap_unit = 0
			end
		end
	end
end
b407_menu_ap_unit = create_command("407/Menu/Configuration/6_ap_unit", "JRX B407 - Menu - Toggle Autopilot Unit", b407_set_ap_unit_CMDhandler)
-- Search Light
function b407_set_search_light_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_s_light == 0 then
				dr_menu_2_options_s_light = 2
			else
				dr_menu_2_options_s_light = 0
			end
		end
	end
end
b407_menu_search_light = create_command("407/Menu/Configuration/5_search_light", "JRX B407 - Menu - Toggle Search Light", b407_set_search_light_CMDhandler)
-- Bear Paws
function b407_set_bear_paws_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_bear_paws == 0 then
				dr_menu_2_options_bear_paws = 2
			else
				dr_menu_2_options_bear_paws = 0
			end
		end
	end
end
b407_menu_bear_paws = create_command("407/Menu/Configuration/5a_bear_paws", "JRX B407 - Menu - Toggle Bear Paws", b407_set_bear_paws_CMDhandler)
-- Logic for Pax
function b407_set_pax_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_Pax == 0 then
				dr_menu_2_options_Pax = 2
			else
				dr_menu_2_options_Pax = 0
			end
		end
	end
end
b407_menu_pax	= create_command("407/Menu/Configuration/4_pax", "JRX B407 - Menu - Toggle Pax", b407_set_pax_CMDhandler)
-- Logic for Copilot
function b407_set_copilot_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_copilot == 0 then
				dr_menu_2_options_copilot = 2
			else
				dr_menu_2_options_copilot = 0
			end
		end
	end
end
b407_menu_copilot	= create_command("407/Menu/Configuration/1_copilot", "JRX B407 - Menu - Toggle Copilot", b407_set_copilot_CMDhandler)
-- Logic for Doors
function b407_set_doors_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_doors == 0 then
            dr_menu_2_options_doors = 2
			else
            dr_menu_2_options_doors = 0
			end
		end
	end
end
b407_menu_doors		= create_command("407/Menu/Configuration/2_doors", "JRX B407 - Menu - Toggle Doors", b407_set_doors_CMDhandler)
-- Logic for RBF
function b407_set_rbf_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_main_rotor_speed <= 1 then
				if dr_menu_rotor_brake == 1 then		
					if dr_menu_2_options_rbf == 0 then
						dr_menu_2_options_rbf = 2
					else
						dr_menu_2_options_rbf = 0
					end
				end
			end
		end
	end
end
b407_menu_rbf		= create_command("407/Menu/Configuration/3_rbf", "JRX B407 - Menu - Toggle Covers and Tie Downs", b407_set_rbf_CMDhandler)
-- Panel Type
function b407_set_panel_type_CMDhandler(phase, duration)
	if phase == 0 then
		if dr_menu_gear_on_ground == 1 then
			if dr_menu_2_options_panel_type == 0 then
            dr_menu_2_options_panel_type = 2
			else
            dr_menu_2_options_panel_type = 0
			end
		end
	end
end
b407_menu_panel_type = create_command("407/Menu/Configuration/10_panel_type", "JRX B407 - Menu - Toggle Light / Dark Panel", b407_set_panel_type_CMDhandler)
-- Calc for Weight Totals
function calculations_for_totals()
	if dr_menu_bus_volts_on				>= 10 then
		b407_weight_1					= 170
	else
		b407_weight_1					= 0
	end
	if dr_menu_2_options_copilot		== 2 then
		b407_weight_2					= 176
	else
		b407_weight_2					= 0
	end
	if dr_menu_2_options_doors			== 2 then
		b407_weight_3					= 32
	else
		b407_weight_3					= 0
	end
	if dr_menu_2_options_rbf			== 2 then
		b407_weight_5					= 32
	else
		b407_weight_5					= 0
	end
	if dr_menu_2_options_Pax			== 2 then
		b407_weight_6					= 331
	else
		b407_weight_6					= 0
	end
	if dr_menu_2_options_s_light		== 2 then
		b407_weight_7					= 11
	else
		b407_weight_7					= 0
	end
	if dr_menu_2_options_ap_unit		== 2 then
		b407_weight_8					= 4
	else
		b407_weight_8					= 0
	end
	if dr_menu_2_options_dual_fc		== 2 then
		b407_weight_9					= 22
	else
		b407_weight_9					= 0
	end
	if dr_menu_2_options_wire_cutters	== 2 then
		b407_weight_10					= 33
	else
		b407_weight_10					= 0
	end
	if dr_menu_2_options_emer_floats	== 2 then
		b407_weight_11					= 66
	else
		b407_weight_11					= 0
	end
	if dr_menu_2_options_bear_paws		== 2 then
		b407_weight_17					= 16
	else
		b407_weight_17					= 0
	end
	if dr_menu_2_options_camera			>= 1 then
		b407_weight_18					= 111
	else
		b407_weight_18					= 0
	end
	
	b407_weight_16					= b407_weight_12 + b407_weight_13 + b407_weight_14 + b407_weight_15
	dr_menu_2_payload_tot_lbs		= b407_weight_16
	b407_weight_m 					= dr_menu_empty_weight 								-- Weight ACF Empty - DISPLAYED LBS
	dr_menu_2_crew_tot_lbs 			= b407_weight_1 + b407_weight_2 + b407_weight_6 	-- Crew Total Weight - DISPLAYED LBS
	dr_menu_2_config_tot_lbs 		= b407_weight_3 + b407_weight_5 + b407_weight_7 + b407_weight_8 + b407_weight_9 + b407_weight_10 + b407_weight_11 + b407_weight_17 + b407_weight_18 -- Config Options - DISPLAYED LBS
	dr_menu_2_auw_tot_lbs 			= dr_menu_total_auw * 2.20462								-- All Up Weight - DISPLAYED LBS
	b407_auw						= b407_weight_1 + b407_weight_2 + b407_weight_3 + b407_weight_5 + b407_weight_6 + b407_weight_7 + b407_weight_8 + b407_weight_9 + b407_weight_10 + b407_weight_11 + b407_weight_12 + b407_weight_13 + b407_weight_14 + b407_weight_15 + b407_weight_17 + b407_weight_18
	dr_menu_total_payload_weight  	= b407_auw * 0.453592
end
function after_physics()
	calculations_for_totals()
	hold_doors_closed()
end

function after_replay()
	calculations_for_totals()
	hold_doors_closed()
end