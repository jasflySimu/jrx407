-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- © JRX Design - JRX BELL 407 (22) - Instrumentation Spill and Cabin Lighting    ---------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Local Variables
local spill_rad_alt_war_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_1_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_2_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_3_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_4_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_5_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_w_6_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_1_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_2_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_3_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_4_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_5_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_g_6_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_com1_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_com2_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_adf1_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_trans_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_davtron_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
--local spill_flood_dme_dist_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_cabin_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
local spill_flood_passen_values				= {0, 0, 0, 0, 0, 0, 0, 0, 0}
-- Find Datarefs
b407_dr_spill_power_on					= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
b407_dr_spill_rad_alt_bug				= find_dataref("sim/cockpit2/gauges/actuators/radio_altimeter_bug_ft_pilot")
b407_dr_spill_rad_alt_feet				= find_dataref("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot")
b407_dr_spill_brightbess_ratio			= find_dataref("sim/flightmodel2/lights/generic_lights_brightness_ratio")
b407_dr_spill_rad_alt_sw				= find_dataref("jrxDR/407/overhead/switches/rad_alt_power")
--
b407_dr_spill_rads_com_1				= find_dataref("sim/cockpit2/radios/actuators/com1_power")
b407_dr_spill_rads_com_2				= find_dataref("sim/cockpit2/radios/actuators/com2_power")
b407_dr_spill_rads_nav_1				= find_dataref("sim/cockpit2/radios/actuators/nav1_power")
b407_dr_spill_rads_nav_2				= find_dataref("sim/cockpit2/radios/actuators/nav2_power")
b407_dr_spill_rads_adf_1				= find_dataref("sim/cockpit2/radios/actuators/adf1_power")
--
b407_dr_spill_avionics_sw				= find_dataref("sim/cockpit2/switches/avionics_power_on")
b407_dr_spill_battery_on				= find_dataref("sim/cockpit2/electrical/battery_on[0]")
b407_dr_spill_panel_flood				= find_dataref("sim/cockpit2/switches/instrument_brightness_ratio")
--b407_dr_dme_slave_source				= find_dataref("sim/cockpit2/radios/actuators/DME_slave_source")
---- Find Custom Datarefs
b407_dr_spill_dh_warning_lamp			= find_dataref("jrxDR/407/operation/dh_warning_lamp")
b407_dr_spill_rads_trans				= find_dataref("jrxDR/407/panels/switches/transponder_power")
b407_dr_spill_passen					= find_dataref("jrxDR/407/overhead/switches/cabin_lights")
---- Create Array Dataref for each Spill Light
spill_flood_passen								= create_dataref("jrxDR/407/lighting/spills/flood_passen", "array[9]")
--
spill_flood_cabin								= create_dataref("jrxDR/407/lighting/spills/flood_cabin", "array[9]")
--
spill_rad_alt_war								= create_dataref("jrxDR/407/lighting/spills/rad_alt_war", "array[9]")
--
spill_flood_w_1									= create_dataref("jrxDR/407/lighting/spills/flood_w_1", "array[9]")
spill_flood_w_2									= create_dataref("jrxDR/407/lighting/spills/flood_w_2", "array[9]")
spill_flood_w_3									= create_dataref("jrxDR/407/lighting/spills/flood_w_3", "array[9]")
spill_flood_w_4									= create_dataref("jrxDR/407/lighting/spills/flood_w_4", "array[9]")
spill_flood_w_5									= create_dataref("jrxDR/407/lighting/spills/flood_w_5", "array[9]")
spill_flood_w_6									= create_dataref("jrxDR/407/lighting/spills/flood_w_6", "array[9]")
--
spill_flood_g_1									= create_dataref("jrxDR/407/lighting/spills/flood_g_1", "array[9]")
spill_flood_g_2									= create_dataref("jrxDR/407/lighting/spills/flood_g_2", "array[9]")
spill_flood_g_3									= create_dataref("jrxDR/407/lighting/spills/flood_g_3", "array[9]")
spill_flood_g_4									= create_dataref("jrxDR/407/lighting/spills/flood_g_4", "array[9]")
spill_flood_g_5									= create_dataref("jrxDR/407/lighting/spills/flood_g_5", "array[9]")
spill_flood_g_6									= create_dataref("jrxDR/407/lighting/spills/flood_g_6", "array[9]")
--
spill_flood_com1								= create_dataref("jrxDR/407/lighting/spills/com1", "array[9]")
spill_flood_com2								= create_dataref("jrxDR/407/lighting/spills/com2", "array[9]")
spill_flood_adf1									= create_dataref("jrxDR/407/lighting/spills/adf1", "array[9]")
spill_flood_trans								= create_dataref("jrxDR/407/lighting/spills/trans", "array[9]")
--
spill_flood_davtron							= create_dataref("jrxDR/407/lighting/spills/davtron", "array[9]")
--
--spill_flood_dme_dist							= create_dataref("jrxDR/407/lighting/spills/dme_dist", "array[9]")

-- Logic to show / Passenger Spill Lights
function sp_passengers()
	if b407_dr_spill_passen >= 1 then
		spill_flood_passen_values = {216, 216, 164, 0.5, 1.3, 0, 0, -1, 0}
	end
	if b407_dr_spill_passen <= 0 then
		spill_flood_passen_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to show / DME Spill Lights
function sp_dme_spill_time_dist_on()
	if b407_dr_spill_power_on >= 10 and b407_dr_spill_avionics_sw == 1 and b407_dr_dme_slave_source ~= 2 then
		spill_flood_dme_dist_values = {255, 0, 0, 0.07, 0.030, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_dme_dist_values = {0, 0, 0, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_avionics_sw == 0 then
		spill_flood_dme_dist_values = {0, 0, 0, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_dme_slave_source == 2 then
		spill_flood_dme_dist_values = {0, 0, 0, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic for Spill Brightness - Panel / Comms Equipment
function sp_com_panel_items_brightness()
		spill_flood_com1_values[4]			= b407_dr_spill_panel_flood[0] * 0.8
		spill_flood_com2_values[4]			= b407_dr_spill_panel_flood[0] * 0.8
		spill_flood_adf1_values[4]			= b407_dr_spill_panel_flood[0] * 0.8
		spill_flood_trans_values[4]			= b407_dr_spill_panel_flood[0] * 0.8
		spill_flood_davtron_values[4]		= b407_dr_spill_panel_flood[0] * 0.8
end
-- Logic to show / Davtron Spill Lights
function sp_davtron()
	if b407_dr_spill_power_on >= 10 then
		spill_flood_davtron_values = {0, 255, 0, 0.3, 0.0313, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_davtron_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to show / trans Radio Spill Lights
function sp_trans()
	if b407_dr_spill_power_on >= 10 and b407_dr_spill_rads_trans == 1 then
		spill_flood_trans_values = {0, 172, 237, 0.5, 0.040, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_trans_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rads_trans == 0 then
		spill_flood_trans_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to show / adf1 Radio Spill Lights
function sp_adf1()
	if b407_dr_spill_power_on >= 10 and b407_dr_spill_avionics_sw == 1 and b407_dr_spill_rads_adf_1 == 1 then
		spill_flood_adf1_values = {251, 44, 16, 1, 0.040, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_adf1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_avionics_sw == 0 then
		spill_flood_adf1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rads_adf_1 == 0 then
		spill_flood_adf1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to show / Com2 / Nav2 Radio Spill Lights
function sp_com2()
	if b407_dr_spill_power_on >= 10 and b407_dr_spill_avionics_sw == 1 and b407_dr_spill_rads_com_2 == 1 then
		spill_flood_com2_values = {251, 44, 16, 1, 0.040, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_com2_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_avionics_sw == 0 then
		spill_flood_com2_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rads_com_1 == 0 then
		spill_flood_com2_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to show / Com1 / Nav1 Radio Spill Lights
function sp_com1()
	if b407_dr_spill_power_on >= 10 and b407_dr_spill_avionics_sw == 1 and b407_dr_spill_rads_com_1 == 1 then
		spill_flood_com1_values = {251, 44, 16, 1, 0.040, 0, 0, -1, -0.9}
	end
	if b407_dr_spill_power_on <= 10 then
		spill_flood_com1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_avionics_sw == 0 then
		spill_flood_com1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rads_com_1 == 0 then
		spill_flood_com1_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic For Panel Flood Spill Lights - White / Green
function sp_panel_flood_white_green()
	if b407_dr_spill_power_on >= 10 then
		spill_flood_w_1_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_w_2_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_w_3_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_w_4_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_w_5_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_w_6_values			= {200, 233, 255, 0.03, 0.7, 0, 0, -1, 0}
		--
		spill_flood_cabin_values		= {216, 216, 164, 0.25, 1.3, 0, 0, -1, -1}
		--
		spill_flood_g_1_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_g_2_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_g_3_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_g_4_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_g_5_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
		spill_flood_g_6_values			= {000, 255, 000, 0.03, 0.7, 0, 0, -1, 0}
	elseif b407_dr_spill_power_on <= 10 then
		spill_flood_w_1_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_w_2_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_w_3_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_w_4_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_w_5_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_w_6_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		--
		spill_flood_cabin_values		= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		--
		spill_flood_g_1_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_g_2_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_g_3_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_g_4_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_g_5_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
		spill_flood_g_6_values			= {0, 0, 0, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic for Flood Brightness - Spill Lights - White / Green
function sp_panel_flood_white_green_brightness()
		spill_flood_w_1_values[4]	= b407_dr_spill_panel_flood[1]
		spill_flood_w_2_values[4]	= b407_dr_spill_panel_flood[1]
		spill_flood_w_3_values[4]	= b407_dr_spill_panel_flood[1]
		spill_flood_w_4_values[4]	= b407_dr_spill_panel_flood[1]
		spill_flood_w_5_values[4]	= b407_dr_spill_panel_flood[1]
		spill_flood_w_6_values[4]	= b407_dr_spill_panel_flood[1]
		--
		spill_flood_cabin_values[4]	= b407_dr_spill_panel_flood[4]
--        
		spill_flood_g_1_values[4]		= b407_dr_spill_panel_flood[2]
		spill_flood_g_2_values[4]		= b407_dr_spill_panel_flood[2]
		spill_flood_g_3_values[4]		= b407_dr_spill_panel_flood[2]
		spill_flood_g_4_values[4]		= b407_dr_spill_panel_flood[2]
		spill_flood_g_5_values[4]		= b407_dr_spill_panel_flood[2]
		spill_flood_g_6_values[4]		= b407_dr_spill_panel_flood[2]
end
-- Logic to show / hide spill lights - RAD ALT Lamp
function sp_rad_alt_led()
	if b407_dr_spill_rad_alt_sw >= 1 then
		if b407_dr_spill_power_on >= 10 and b407_dr_spill_rad_alt_bug >= b407_dr_spill_rad_alt_feet then
			spill_rad_alt_war_values = {255, 165, 000, 1.00, 0.0120, 0, 0, 0, -1}
		end
	end
	if b407_dr_spill_power_on <= 10 then
		spill_rad_alt_war_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rad_alt_bug <= b407_dr_spill_rad_alt_feet then
		spill_rad_alt_war_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
	if b407_dr_spill_rad_alt_sw == 0 then
		spill_rad_alt_war_values = {000, 000, 000, 0, 0, 0, 0, 0, 0}
	end
end
-- Logic to populate Spill Lights
function sp_spill_lights_population()
	for i = 0, 8 do
		spill_rad_alt_war[i]				= spill_rad_alt_war_values[i+1]
		spill_flood_w_1[i]					= spill_flood_w_1_values[i+1]
		spill_flood_w_2[i]					= spill_flood_w_2_values[i+1]
		spill_flood_w_3[i]					= spill_flood_w_3_values[i+1]
		spill_flood_w_4[i]					= spill_flood_w_4_values[i+1]
		spill_flood_w_5[i]					= spill_flood_w_5_values[i+1]
		spill_flood_w_6[i]					= spill_flood_w_6_values[i+1]
		--
		spill_flood_cabin[i]				= spill_flood_cabin_values[i+1]
		--
		spill_flood_passen[i]				= spill_flood_passen_values[i+1]
		--		
		spill_flood_g_1[i]					= spill_flood_g_1_values[i+1]
		spill_flood_g_2[i]					= spill_flood_g_2_values[i+1]
		spill_flood_g_3[i]					= spill_flood_g_3_values[i+1]
		spill_flood_g_4[i]					= spill_flood_g_4_values[i+1]
		spill_flood_g_5[i]					= spill_flood_g_5_values[i+1]
		spill_flood_g_6[i]					= spill_flood_g_6_values[i+1]
		--		
		spill_flood_com1[i]				= spill_flood_com1_values[i+1]
		spill_flood_com2[i]				= spill_flood_com2_values[i+1]
		spill_flood_adf1[i]					= spill_flood_adf1_values[i+1]
		spill_flood_trans[i]				= spill_flood_trans_values[i+1]
		--		
		spill_flood_davtron[i]			= spill_flood_davtron_values[i+1]
		--spill_flood_dme_dist[i]			= spill_flood_dme_dist_values[i+1]
	end
end
-- Run the Logic
function after_physics()
sp_spill_lights_population()
sp_rad_alt_led()
sp_panel_flood_white_green()
sp_panel_flood_white_green_brightness()
sp_trans()
sp_adf1()
sp_com2()
sp_com1()
sp_davtron()
sp_com_panel_items_brightness()
--sp_dme_spill_time_dist_on()
sp_passengers()
end
function after_replay()
sp_spill_lights_population()
sp_rad_alt_led()
sp_panel_flood_white_green()
sp_panel_flood_white_green_brightness()
sp_trans()
sp_adf1()
sp_com2()
sp_com1()
sp_davtron()
sp_com_panel_items_brightness()
--sp_dme_spill_time_dist_on()
sp_passengers()
end