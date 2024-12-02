------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) Conversions / Calculations / Functions ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Instrument Value Masks
dr_inst_mask_trq 		= find_dataref("jrxDR/407/engine/inst_mask_trq")
dr_inst_mask_mgt 		= find_dataref("jrxDR/407/engine/inst_mask_mgt")
dr_inst_mask_ng 		= find_dataref("jrxDR/407/engine/inst_mask_ng")
dr_inst_mask_fuel_1 	= find_dataref("jrxDR/407/engine/inst_mask_fuel_1")
dr_trq_value			= find_dataref("jrxDR/407/engine/trq_percent")
dr_ng_value				= find_dataref("jrxDR/407/engine/indicators/ng_value")
dr_mgt_value			= find_dataref("jrxDR/407/engine/engn_itt_value")
dr_fuel_total			= find_dataref("jrxDR/407/engine/lbs_tank_total")

function trq_inst_value_mask()--WORKING
	if dr_trq_value >= 0 and dr_trq_value <= 0.9 then
		dr_inst_mask_trq = 0
	end
	if dr_trq_value >= 0.9 and dr_trq_value <= 9.99 then
		dr_inst_mask_trq = 1
	end
	if dr_trq_value >= 9.99 and dr_trq_value <= 99.9 then
		dr_inst_mask_trq = 2
	end
	if dr_trq_value >= 99.9 then
		dr_inst_mask_trq = 3
	end
end

function ng_inst_value_mask()--WORKING
	if dr_ng_value >= 0 and dr_ng_value <= 0.9 then
		dr_inst_mask_ng = 0
	end
	if dr_ng_value >= 0.9 and dr_ng_value <= 9.99 then
		dr_inst_mask_ng = 1
	end
	if dr_ng_value >= 9.99 and dr_ng_value <= 99.9 then
		dr_inst_mask_ng = 2
	end
	if dr_ng_value >= 99.9 then
		dr_inst_mask_ng = 3
	end
end

function mgt_inst_value_mask()--WORKING
	if dr_mgt_value >= 0 and dr_mgt_value <= 10 then
		dr_inst_mask_mgt = 0
	end
	if dr_mgt_value >= 10 and dr_mgt_value <= 100 then
		dr_inst_mask_mgt = 1
	end
	if dr_mgt_value >= 100 and dr_mgt_value <= 1000 then
		dr_inst_mask_mgt = 2
	end
	if dr_mgt_value >= 1000 then
		dr_inst_mask_mgt = 3
	end
end

function fuel_1_inst_value_mask()--WORKING
	if dr_fuel_total >= 0 and dr_fuel_total <= 10 then
		dr_inst_mask_fuel_1 = 0
	end
	if dr_fuel_total >= 10 and dr_fuel_total <= 100 then
		dr_inst_mask_fuel_1 = 1
	end
	if dr_fuel_total >= 100 and dr_fuel_total <= 1000 then
		dr_inst_mask_fuel_1 = 2
	end
	if dr_fuel_total >= 1000 then
		dr_inst_mask_fuel_1 = 3
	end
end

dr_engn_itt_temp		= find_dataref("sim/cockpit2/engine/indicators/ITT_deg_C[0]")
-- NG Display Adjustment
dr_engn_n1_pct 			= find_dataref("sim/cockpit2/engine/indicators/N1_percent[0]")
function ng_adjust_value()--WORKING
	dr_ng_value = dr_engn_n1_pct * 1
end
-- GEN On Amps Display
dr_generator_amps 			= find_dataref("sim/cockpit2/electrical/generator_amps[0]")
dr_generator_amps_value 	= find_dataref("jrxDR/407/panels/switches/generator_sw_value")
function amps_display_value()--WORKING
dr_generator_amps_value 	= dr_generator_amps * 4
end
-- Collective Lock
dr_collective_lock 			= find_dataref("jrxDR/407/flight/controls/collective_lock")
dr_collective_pitch	 		= find_dataref("sim/flightmodel/engine/POINT_pitch_deg[0]")
dr_override_prop_pitch		= find_dataref("sim/operation/override/override_prop_pitch")
function lock_collective()--WORKING
	if dr_collective_pitch <= -1 then
		if dr_gear_on_ground == 1 then
			if dr_collective_lock == 1 then
				dr_override_prop_pitch = 1
			else
				dr_override_prop_pitch = 0
			end
		end
	end
end
-- FADEC Button / Cover Functions
dr_fadec_cover 	= find_dataref("jrxDR/407/panels/switches/fadec_cover")
dr_fadec_switch	= find_dataref("sim/cockpit2/engine/actuators/fadec_on[0]")
function fadec_cover_switch()--WORKING
	if dr_fadec_cover == 0 then
		dr_fadec_switch = 1
	else
		dr_fadec_switch = dr_fadec_switch
	end
end
-- Power Switch Functions to Instruments - AI
dr_switch_ai_power			= find_dataref("jrxDR/407/overhead/switches/att_gyro_power")
dr_kneedle_pitch_ai_power	= find_dataref("jrxDR/407/overhead/switches/att_pitch_kneedle")
dr_kneedle_roll_ai_power	= find_dataref("jrxDR/407/overhead/switches/att_roll_kneedle")
dr_kneedle_roll_ai_value	= find_dataref("sim/cockpit2/gauges/indicators/roll_vacuum_deg_pilot")
dr_kneedle_pitch_ai_value	= find_dataref("sim/cockpit2/gauges/indicators/pitch_vacuum_deg_pilot")
function ai_pwr_sw()--WORKING
	if dr_switch_ai_power >= 1 then
		dr_kneedle_pitch_ai_power 	= dr_kneedle_pitch_ai_value
		dr_kneedle_roll_ai_power 	= dr_kneedle_roll_ai_value
	else
		dr_kneedle_pitch_ai_power 	= dr_kneedle_pitch_ai_power
		dr_kneedle_roll_ai_power 	= dr_kneedle_roll_ai_power
	end
end
-- Power Switch Functions to Instruments - RAD ALT
dr_switch_rad_alt_power		= find_dataref("jrxDR/407/overhead/switches/rad_alt_power")
dr_kneedle_rad_alt_power	= find_dataref("jrxDR/407/overhead/switches/rad_alt_power_kneedle")
dr_rad_alt_value			= find_dataref("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot")
function rad_alt_pwr_sw()--WORKING
	if dr_switch_rad_alt_power >= 1 then
		dr_kneedle_rad_alt_power = dr_rad_alt_value
	else
		dr_kneedle_rad_alt_power = dr_kneedle_rad_alt_power
	end
end
-- Fuel Valve Functions
dr_fuel_valve_switch			= find_dataref("sim/cockpit2/fuel/firewall_closed_left")
dr_fuel_cut						= find_dataref("sim/cockpit2/fuel/fuel_tank_pump_on")
dr_fuel_valve_cover				= find_dataref("jrxDR/407/panels/switches/fuel_valve_cover")
dr_fuel_valve_cover_value		= find_dataref("jrxDR/407/panels/switches/fuel_valve_cover_value")
function fuel_valve()--WORKING
	if dr_fuel_valve_cover == 0 then
		dr_fuel_valve_switch = 0
		dr_fuel_cut[0] = 1
		dr_fuel_cut[1] = 1
		dr_fuel_cut[2] = 1
	else
		dr_fuel_valve_switch = dr_fuel_valve_switch
	end
	if dr_fuel_valve_switch == 1 then
		dr_fuel_cut[0] = 0
		dr_fuel_cut[1] = 0
		dr_fuel_cut[2] = 0
	end	
end
-- Rotor Brake
dr_rotor_brake_switch	= find_dataref("jrxDR/407/panels/switches/rotor_brake_handle")
dr_rotor_brake_ratio	= find_dataref("sim/cockpit2/switches/rotor_brake_ratio")
dr_rotor_brake			= find_dataref("sim/cockpit2/switches/rotor_brake")
function rotor_brake_switch()--WORKING
dr_rotor_brake_ratio = dr_rotor_brake_switch
	if dr_rotor_brake_switch >= 0.05 then
		dr_rotor_brake = 1
		dr_rotor_brake_ratio = dr_rotor_brake_switch * 0.4
	else
		dr_rotor_brake = 0
		dr_rotor_brake_ratio = 0
	end
end
-- Functions - Pedal Stop - Restrict Pedal Movement after 55 Knots
dr_heading_ratio			= find_dataref("sim/cockpit2/controls/yoke_heading_ratio")
dr_hydraulic_pump_on		= find_dataref("sim/cockpit2/switches/electric_hydraulic_pump_on")
dr_pedal_stop_test			= find_dataref("jrxDR/407/controls/pedal_stop_test")
dr_airspeed_kts_pilot		= find_dataref("sim/cockpit2/gauges/indicators/airspeed_kts_pilot")
dr_pedal_show_hide			= find_dataref("jrxDR/407/controls/show_hide_pedals")
function pedal_stop()--WORKING
	if dr_pedal_stop_test == 1 or dr_airspeed_kts_pilot >= 55 then
		dr_pedal_show_hide = 2
	else
		dr_pedal_show_hide = 0
	end
end
-- Functions - Cyclic Centering Annunciator
dr_control_left		= find_dataref("jrxDR/407/controls/centering/left")
dr_control_right	= find_dataref("jrxDR/407/controls/centering/right")
dr_control_fwd		= find_dataref("jrxDR/407/controls/centering/fwd")
dr_control_aft		= find_dataref("jrxDR/407/controls/centering/aft")
dr_control_value	= find_dataref("jrxDR/407/controls/centering/value")
dr_control_annun	= find_dataref("jrxDR/407/panel/annun/cyclic_center")
dr_roll_ratio		= find_dataref("sim/joystick/yoke_roll_ratio")
dr_pitch_ratio		= find_dataref("sim/joystick/yoke_pitch_ratio")
dr_gear_on_ground	= find_dataref("sim/cockpit2/tcas/targets/position/weight_on_wheels[0]")
function cyclic_centering()--WORKING
	if dr_gear_on_ground == 1 then
		if dr_roll_ratio <= -0.20 then
			dr_control_left = 1
		else
		dr_control_left = 0
		end
	end
	if dr_gear_on_ground == 1 then
		if dr_roll_ratio >= 0.20 then
			dr_control_right = 1
		else
		dr_control_right = 0
		end
	end
	if dr_gear_on_ground == 1 then
		if dr_pitch_ratio >= 0.20 then
			dr_control_aft = 1
		else
		dr_control_aft = 0
		end
	end
	if dr_gear_on_ground == 1 then
		if dr_pitch_ratio <= -0.20 then
			dr_control_fwd = 1
		else
		dr_control_fwd = 0
		end
	end
	if dr_control_value ~= 0 then
		dr_control_annun = 1
	else
		dr_control_annun = 0
	end
	dr_control_value = dr_control_left + dr_control_right + dr_control_fwd + dr_control_aft
end
-- Functions - Kgs to Lbs - Fuel Weight
dr_fuel_kg_0		= find_dataref("sim/flightmodel/weight/m_fuel[0]")
dr_fuel_kg_1		= find_dataref("sim/flightmodel/weight/m_fuel[1]")
dr_fuel_lbs_0		= find_dataref("jrxDR/407/engine/lbs_tank_0")
dr_fuel_lbs_1		= find_dataref("jrxDR/407/engine/lbs_tank_1")
function fuel_conversion_to_lbs()--WORKING
	dr_fuel_lbs_0 = dr_fuel_kg_0 * 2.20462
	dr_fuel_lbs_1 = dr_fuel_kg_1 * 2.20462
	dr_fuel_total = (dr_fuel_kg_0 + dr_fuel_kg_1) * (2.20462)
end
-- Functions - M/S to Knots
dr_calc_meters_per_second 		= find_dataref("sim/flightmodel2/position/groundspeed")
dr_calc_knots 					= find_dataref("jrxDR/407/conv/ms/knots")
function ms_to_knots()--WORKING
	dr_calc_knots = dr_calc_meters_per_second * 1.94384
end
-- Functions GTN TAB Rotation
dr_menu_rotate_0 	= find_dataref("jrxDR/407/configuration/options/menu_rotate_1")
dr_menu_rotate_1 	= find_dataref("jrxDR/407/configuration/options/menu_rotate_2")
dr_menu_rotate_2 	= find_dataref("jrxDR/407/configuration/options/menu_rotate_3")
dr_menu_rotate_3 	= find_dataref("jrxDR/407/configuration/options/menu_rotate_4")
dr_menu_rotate_4 	= find_dataref("jrxDR/407/configuration/options/menu_rotate_5")
dr_menu_avitab_on 	= find_dataref("jrxDR/407/configuration/options/menu_butt_4")
local rotate_timer_0 = 0
local rotate_timer_1 = 0
local rotate_timer_2 = 0
local rotate_timer_3 = 0
local rotate_timer_4 = 0
function gtn_tab_rotation()--WORKING
	dr_menu_rotate_0 = rotate_timer_0
	dr_menu_rotate_1 = rotate_timer_1
	dr_menu_rotate_2 = rotate_timer_2
	dr_menu_rotate_3 = rotate_timer_3
	dr_menu_rotate_4 = rotate_timer_4
	if dr_menu_avitab_on == 2 then
			rotate_timer_0 = rotate_timer_0 + 1 * SIM_PERIOD
	end
	if dr_menu_avitab_on == 2 then
		if rotate_timer_0 >= 1.5 then
			dr_menu_rotate_0	= 1.5
			rotate_timer_0			= 1.5
		end
	end
	if dr_menu_avitab_on == 0 then
		if rotate_timer_0 ~= 0 then
			rotate_timer_0 = rotate_timer_0 + -0.75 * SIM_PERIOD
		end
	end
	if dr_menu_avitab_on == 0 then
		if dr_menu_rotate_0 <= 0 then
			dr_menu_rotate_0 = 0
			rotate_timer_0 = 0
		end
	end
--
	if dr_menu_avitab_on == 2 then
			rotate_timer_1 = rotate_timer_1 + 1 * SIM_PERIOD
	end
	if dr_menu_avitab_on == 2 then
		if rotate_timer_1 >= 1.75 then
			dr_menu_rotate_1	= 1.75
			rotate_timer_1			= 1.75
		end
	end
	if dr_menu_avitab_on == 0 then
		if rotate_timer_1 ~= 0 then
			rotate_timer_1 = rotate_timer_1 + -1 * SIM_PERIOD
		end
	end
	if dr_menu_avitab_on == 0 then
		if dr_menu_rotate_1 <= 0 then
			dr_menu_rotate_1 = 0
			rotate_timer_1 = 0
		end
	end
--
	if dr_menu_avitab_on == 2 then
			rotate_timer_2 = rotate_timer_2 + 1 * SIM_PERIOD
	end
	if dr_menu_avitab_on == 2 then
		if rotate_timer_2 >= 2 then
			dr_menu_rotate_2	= 2
			rotate_timer_2			= 2
		end
	end
	if dr_menu_avitab_on == 0 then
		if rotate_timer_2 ~= 0 then
			rotate_timer_2 = rotate_timer_2 + -1 * SIM_PERIOD
		end
	end
	if dr_menu_avitab_on == 0 then
		if dr_menu_rotate_2 <= 0 then
			dr_menu_rotate_2 = 0
			rotate_timer_2 = 0
		end
	end
--
	if dr_menu_avitab_on == 2 then
			rotate_timer_3 = rotate_timer_3 + 1 * SIM_PERIOD
	end
	if dr_menu_avitab_on == 2 then
		if rotate_timer_3 >= 2.25 then
			dr_menu_rotate_3	= 2.25
			rotate_timer_3			= 2.25
		end
	end
	if dr_menu_avitab_on == 0 then
		if rotate_timer_3 ~= 0 then
			rotate_timer_3 = rotate_timer_3 + -1 * SIM_PERIOD
		end
	end
	if dr_menu_avitab_on == 0 then
		if dr_menu_rotate_3 <= 0 then
			dr_menu_rotate_3 = 0
			rotate_timer_3 = 0
		end
	end
----
	if dr_menu_avitab_on == 2 then
			rotate_timer_4 = rotate_timer_4 + 0.15 * SIM_PERIOD
	end
	if dr_menu_avitab_on == 2 then
		if rotate_timer_4 >= 0.25 then
			dr_menu_rotate_4	= 0.25
			rotate_timer_4			= 0.25
		end
	end
	if dr_menu_avitab_on == 0 then
		if rotate_timer_4 ~= 0 then
			rotate_timer_4 = rotate_timer_4 + -0.21 * SIM_PERIOD
		end
	end
	if dr_menu_avitab_on == 0 then
		if dr_menu_rotate_4 <= 0 then
			dr_menu_rotate_4 = 0
			rotate_timer_4 = 0
		end
	end
end
-- Show / Hide Pilots - Headset / Helmet for internal / external views + VR
dr_show_headset			= find_dataref("jrxDR/407/configuration/options/headset")
dr_show_headset_copilot	= find_dataref("jrxDR/407/configuration/options/headset_copilot")
dr_show_headset_hanging	= find_dataref("jrxDR/407/configuration/options/headset_hanging")
dr_show_helmet			= find_dataref("jrxDR/407/configuration/options/helmet")
dr_show_pilot_helmet	= find_dataref("jrxDR/407/configuration/options/show_helmet")
dr_view_is_external		= find_dataref("sim/graphics/view/view_is_external")
dr_view_is_vr			= find_dataref("sim/graphics/VR/teleport_on_ground")
dr_bus_volts_on			= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
dr_show_copilot			= find_dataref("jrxDR/407/configuration/options/copilot")
-- Function Copilots Headset
function copilot_headset()--WORKING
	if dr_show_headset_hanging == 2 then
		if dr_show_copilot == 2 then
			dr_show_headset_copilot = 2
		end
	end
	if dr_show_headset_hanging == 0 then
		if dr_show_copilot == 2 then
			dr_show_headset_copilot = 0
		end
	end
	if dr_show_headset_hanging == 2 then
		if dr_show_copilot == 0 then
			dr_show_headset_copilot = 0
		end
	end
end
-- Function Either or Headsets / Helmets
function helmet_or_headsets()--WORKING
	if dr_show_headset_hanging == 2 then
			dr_show_helmet = 0
	end
	if dr_show_headset_hanging == 0 then
			dr_show_helmet = dr_show_helmet
	end
	if dr_show_helmet == 2 then
			dr_show_headset_hanging = 0
	end
	if dr_show_helmet == 0 then
			dr_show_headset_hanging = dr_show_headset_hanging
	end
end
-- Function Pilots Headset
function pilot_headset()--WORKING
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 0 then
				if dr_show_headset_hanging == 2 then
					dr_show_headset = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 0 then
				if dr_show_headset_hanging == 0 then
					dr_show_headset = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 1 then
			if dr_view_is_vr == 0 then
				if dr_show_headset_hanging == 2 then
					dr_show_headset = 2
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 1 then
			if dr_view_is_vr == 0 then
				if dr_show_headset_hanging == 0 then
					dr_show_headset = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 1 then
				if dr_show_headset_hanging == 2 then
					dr_show_headset = 2
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 1 then
				if dr_show_headset_hanging == 0 then
					dr_show_headset = 0
				end
			end
		end
	end
end
-- Function Pilots Helmet
function pilot_helmet()--WORKING
if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 0 then
				if dr_show_helmet == 2 then
					dr_show_pilot_helmet = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 0 then
				if dr_show_helmet == 0 then
					dr_show_pilot_helmet = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 1 then
			if dr_view_is_vr == 0 then
				if dr_show_helmet == 2 then
					dr_show_pilot_helmet = 2
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 1 then
			if dr_view_is_vr == 0 then
				if dr_show_helmet == 0 then
					dr_show_pilot_helmet = 0
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 1 then
				if dr_show_helmet == 2 then
					dr_show_pilot_helmet = 2
				end
			end
		end
	end
	if dr_bus_volts_on >= 10 then
		if dr_view_is_external == 0 then
			if dr_view_is_vr == 1 then
				if dr_show_helmet == 0 then
					dr_show_pilot_helmet = 0
				end
			end
		end
	end
end
-- Flight Level Generation for Transponder / Misc
dr_trans_fl				= find_dataref("jrxDR/407/panels/switches/transponder_altitude")
dr_pressure_altitude 	= find_dataref("sim/flightmodel/misc/h_ind")
-- Function FL Number Generation
function trans_fl_generation()
	if dr_pressure_altitude >= 0 then
	dr_trans_fl =000
	end
	if dr_pressure_altitude >= 1000 then
	dr_trans_fl = 010
	end
	if dr_pressure_altitude >= 2000 then
	dr_trans_fl = 020
	end
	if dr_pressure_altitude >= 3000 then
	dr_trans_fl = 030
	end
	if dr_pressure_altitude >= 4000 then
	dr_trans_fl = 040
	end
	if dr_pressure_altitude >= 5000 then
	dr_trans_fl = 050
	end
	if dr_pressure_altitude >= 6000 then
	dr_trans_fl = 060
	end
	if dr_pressure_altitude >= 7000 then
	dr_trans_fl = 070
	end
	if dr_pressure_altitude >= 8000 then
	dr_trans_fl = 080
	end
	if dr_pressure_altitude >= 9000 then
	dr_trans_fl = 090
	end
	if dr_pressure_altitude >= 10000 then
	dr_trans_fl = 100
	end
	if dr_pressure_altitude >= 11000 then
	dr_trans_fl = 110
	end
	if dr_pressure_altitude >= 12000 then
	dr_trans_fl = 120
	end
	if dr_pressure_altitude >= 13000 then
	dr_trans_fl = 130
	end
	if dr_pressure_altitude >= 14000 then
	dr_trans_fl = 140
	end
		if dr_pressure_altitude >= 15000 then
	dr_trans_fl = 150
	end
	if dr_pressure_altitude >=  16000 then
	dr_trans_fl = 160
	end
	if dr_pressure_altitude >= 17000 then
	dr_trans_fl = 170
	end
	if dr_pressure_altitude >= 18000 then
	dr_trans_fl = 180
	end
	if dr_pressure_altitude >= 19000 then
	dr_trans_fl = 190
	end
	if dr_pressure_altitude >= 20000 then
	dr_trans_fl = 200
	end
	if dr_pressure_altitude >= 21000 then
	dr_trans_fl = 210
	end
	if dr_pressure_altitude >= 22000 then
	dr_trans_fl = 220
	end
	if dr_pressure_altitude >= 23000 then
	dr_trans_fl = 230
	end
	if dr_pressure_altitude >= 24000 then
	dr_trans_fl = 240
	end
		if dr_pressure_altitude >= 25000 then
	dr_trans_fl = 250
	end
	if dr_pressure_altitude >= 26000 then
	dr_trans_fl = 260
	end
	if dr_pressure_altitude >= 27000 then
	dr_trans_fl = 270
	end
	if dr_pressure_altitude >= 28000 then
	dr_trans_fl = 280
	end
	if dr_pressure_altitude >= 29000 then
	dr_trans_fl = 290
	end
	if dr_pressure_altitude >= 30000 then
	dr_trans_fl = 300
	end
end
-- Hobbs Time Conversion for 1/10th
hobbs_conversion 		= find_dataref("jrxDR/407/conv/hobbs/mins")
hobbs_mins				= find_dataref("sim/cockpit2/clock_timer/hobbs_time_minutes")
function hobbs_hours_convert()
hobbs_conversion 		= math.floor(hobbs_mins / 6)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Davtron Gauge Hours / Mins Conversion
sim_time_seconds		= find_dataref("sim/time/total_flight_time_sec")
davtron_time_hours 		= find_dataref("jrxDR/407/davtron_gauge/davtron_flight_time_hours")
davtron_time_mins	 	= find_dataref("jrxDR/407/davtron_gauge/davtron_flight_time_mins")
function davtron_time_conversion()
davtron_time_hours 		= math.floor(sim_time_seconds / 3600)
davtron_time_mins		= math.floor(sim_time_seconds / 60)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DH Warning Light Function
dh_warning_lamp 		= find_dataref("jrxDR/407/operation/dh_warning_lamp")
rad_alt_bug				= find_dataref("sim/cockpit2/gauges/actuators/radio_altimeter_bug_ft_pilot")
function dh_warning_lamp_on()--WORKING
	if rad_alt_bug >= dr_rad_alt_value then
		dh_warning_lamp = 1
	else
		dh_warning_lamp = 0
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fuel Weight Conversion - Kg to Lbs
conversion_fuel_total_lbs	= find_dataref("jrxDR/407/configuration/options/fuel_Weight_total_lbs")
function convertion_kg_lbs()--WORKING
	conversion_fuel_total_lbs 		= (dr_fuel_kg_0 + dr_fuel_kg_1) * 2.204622
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Floats / Inflated
switches_floats_armed 		= find_dataref("jrxDR/407/overhead/switches/floats_armed")
switches_floats_inflate 	= find_dataref("jrxDR/407/overhead/switches/floats_inflate")
switches_floats_inflated 	= find_dataref("jrxDR/407/overhead/switches/floats_inflated")
switches_floats_verify	 	= find_dataref("jrxDR/407/collective/switches/verify")
switches_floats_cover	 	= find_dataref("jrxDR/407/overhead/switches/floats_cover")
switches_floats_enabled	 	= find_dataref("jrxDR/407/configuration/options/floats")
local sw_floats_armed 		= 0
local sw_floats_inflate		= 0
local sw_floats_cover	 	= 0
local sum_switches			= 0
local floats_enabled		= 0
function inflate_floats()--WORKING
		sum_switches = sw_floats_armed + sw_floats_inflate + sw_floats_cover + floats_enabled
		switches_floats_verify = sum_switches
		if switches_floats_enabled == 2 then
			floats_enabled 			= 1
		end
		if switches_floats_armed == 1 then
			sw_floats_armed 			= 1
		end
		if switches_floats_cover == 1 then
			sw_floats_cover = 1
		end
		if switches_floats_inflate == 1 then
			sw_floats_inflate = 1
		else
			sw_floats_inflate = -1
		end
		if switches_floats_verify == 4 then
			switches_floats_inflated = (switches_floats_inflated) + 5 * (SIM_PERIOD)
			if switches_floats_inflated >= 4.90 then
				switches_floats_inflated = 5.0
			end
		end
		if switches_floats_verify ~= 4 then
			switches_floats_inflated = 0
		end
		if switches_floats_cover ~= 1 then
			switches_floats_inflate = 0
		end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Landing Lights Combination Switch
switches_landing_combo		= find_dataref("jrxDR/407/panels/switches/landing_lights")
switches_landing_0			= find_dataref("sim/cockpit2/switches/landing_lights_switch[0]")
switches_landing_1			= find_dataref("sim/cockpit2/switches/taxi_light_on")
function landing_lights_switch()--WORKING
	if  switches_landing_combo == 0 then
		switches_landing_0 = 0
		switches_landing_1 = 0
	end
	if  switches_landing_combo == 1 then
		switches_landing_0 = 1
		switches_landing_1 = 0
	end
	if  switches_landing_combo == 2 then
		switches_landing_0 = 1
		switches_landing_1 = 1
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function after_physics()
dr_mgt_value = dr_engn_itt_temp
trq_inst_value_mask()
ng_inst_value_mask()
mgt_inst_value_mask()
fuel_1_inst_value_mask()
pedal_stop()
ng_adjust_value()
amps_display_value()
lock_collective()
fadec_cover_switch()
ai_pwr_sw()
rad_alt_pwr_sw()
fuel_valve()
rotor_brake_switch()
cyclic_centering()
fuel_conversion_to_lbs()
ms_to_knots()
gtn_tab_rotation()
copilot_headset()
helmet_or_headsets()
pilot_headset()
pilot_helmet()
inflate_floats()
hobbs_hours_convert()
davtron_time_conversion()
dh_warning_lamp_on()
convertion_kg_lbs()
trans_fl_generation()
landing_lights_switch()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function after_replay()
dr_mgt_value = dr_engn_itt_temp
trq_inst_value_mask()
ng_inst_value_mask()
mgt_inst_value_mask()
fuel_1_inst_value_mask()
pedal_stop()
ng_adjust_value()
amps_display_value()
lock_collective()
fadec_cover_switch()
ai_pwr_sw()
rad_alt_pwr_sw()
fuel_valve()
rotor_brake_switch()
cyclic_centering()
fuel_conversion_to_lbs()
ms_to_knots()
gtn_tab_rotation()
copilot_headset()
helmet_or_headsets()
pilot_headset()
pilot_helmet()
inflate_floats()
hobbs_hours_convert()
davtron_time_conversion()
dh_warning_lamp_on()
convertion_kg_lbs()
trans_fl_generation()
landing_lights_switch()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function aircraft_load()
--end

--function flight_start()
--end