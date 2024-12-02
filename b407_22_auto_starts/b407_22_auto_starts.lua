-- JRX MBB Bo 105 - Start Conditions

-- Local Variables
local auto_start_triggered 	= false

-- Find Datarefs

-- Manual Starting
b407_startup_burning_fuel		= find_dataref("sim/flightmodel2/engines/engine_is_burning_fuel[0]")
b407_startup_starter_key		= find_dataref("sim/cockpit2/engine/actuators/ignition_key[0]") -- 0 = off, 1 = left, 2 = right, 3 = both, 4 = starting
b407_startup_ignition_on		= find_dataref("sim/cockpit2/engine/actuators/auto_ignite_on[0]")
b407_startup_timer_on			= find_dataref("sim/cockpit2/switches/custom_slider_on[21]")
b407_startup_timer_value		= find_dataref("sim/flightmodel2/misc/custom_slider_ratio[21]")
-- Testing
b407_startup_idle_stop			= find_dataref("jrxDR/407/flight/controls/idle_stop")
b407_startup_starter_sw			= find_dataref("jrxDR/407/collective/switches/starter")
b407_startup_override_yaw 		= find_dataref("sim/operation/override/override_joystick_heading")
b407_startup_override_pitch 	= find_dataref("sim/operation/override/override_joystick_pitch")
b407_startup_override_roll 		= find_dataref("sim/operation/override/override_joystick_roll")
b407_startup_override_coll 		= find_dataref("sim/operation/override/override_prop_pitch")
b407_startup_pitch_set			= find_dataref("sim/joystick/yoke_pitch_ratio")
b407_startup_roll_set			= find_dataref("sim/joystick/yoke_roll_ratio")
b407_startup_yaw_set			= find_dataref("sim/joystick/yoke_heading_ratio")
-- Testing - Others
b407_startup_park_b_0 			= find_dataref("sim/multiplayer/controls/parking_brake[0]")
b407_startup_park_b_1 			= find_dataref("sim/multiplayer/controls/parking_brake[1]")
b407_startup_park_b_2 			= find_dataref("sim/multiplayer/controls/parking_brake[2]")
b407_startup_park_b_3 			= find_dataref("sim/multiplayer/controls/parking_brake[3]")
b407_startup_park_b_4 			= find_dataref("sim/multiplayer/controls/parking_brake[4]")
b407_startup_park_b_5 			= find_dataref("sim/multiplayer/controls/parking_brake[5]")
b407_startup_park_b_6 			= find_dataref("sim/multiplayer/controls/parking_brake[6]")
b407_startup_park_b_7 			= find_dataref("sim/multiplayer/controls/parking_brake[7]")
b407_startup_park_b_8 			= find_dataref("sim/multiplayer/controls/parking_brake[8]")
-- Required
b407_startup_auto				= find_dataref("sim/flightmodel2/misc/auto_start_in_progress")
b407_startup_running 			= find_dataref("sim/operation/prefs/startup_running")
b407_startup_bus_volts 			= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
-- Airframe / Setup
b407_startup_set_rbf			= find_dataref("jrxDR/407/configuration/options/remove_before_flight")
b407_startup_set_rotor_brake	= find_dataref("sim/cockpit2/switches/rotor_brake")
b407_startup_fuel_load_0		= find_dataref("sim/flightmodel/weight/m_fuel[0]")
b407_startup_fuel_load_1		= find_dataref("sim/flightmodel/weight/m_fuel[1]")
b407_startup_collective_lock	= find_dataref("jrxDR/407/flight/controls/collective_lock")
b407_startup_cyclic_lock		= find_dataref("jrxDR/407/flight/controls/cyclic_lock")
-- Pre-Start Items
b407_startup_battery 			= find_dataref("sim/cockpit2/electrical/battery_on[0]")
b407_startup_hyd_pump 			= find_dataref("sim/cockpit2/switches/electric_hydraulic_pump_on")
b407_start_up_fuel_switch		= find_dataref("sim/cockpit2/fuel/firewall_closed_left")
b407_start_up_fuel_cover		= find_dataref("jrxDR/407/panels/switches/fuel_valve_cover")
b407_startup_fuel_pump_0 		= find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[0]")
b407_startup_fuel_pump_1 		= find_dataref("sim/cockpit2/engine/actuators/fuel_pump_on[1]")
-- Switches
b407_startup_sw_gen_0			= find_dataref("sim/cockpit2/electrical/generator_on[0]")
b407_starter_fuel_on_0			= find_dataref("sim/cockpit2/engine/actuators/mixture_ratio[0]")
b407_startup_sw_pitot_0			= find_dataref("sim/cockpit/switches/pitot_heat_on")
b407_startup_anti_ice 			= find_dataref("sim/cockpit2/ice/anti_ice_engine_air[0]")
b407_startup_Part_sep 			= find_dataref("jrxDR/407/overhead/switches/part_sep")
b407_startup_avionics	 		= find_dataref("sim/cockpit/electrical/avionics_on")
b407_startup_heater 			= find_dataref("sim/cockpit2/pressurization/actuators/heater_on")
b407_startup_defog 				= find_dataref("jrxDR/407/overhead/switches/defog")
b407_startup_elec_trim 			= find_dataref("jrxDR/407/Switches/auto_trim_power")
b407_startup_trim_power 		= find_dataref("jrxDR/407/overhead/switches/force_trim_power")
b407_startup_air_cond 			= find_dataref("sim/cockpit2/pressurization/actuators/air_cond_on")
b407_startup_air_cond_set 		= find_dataref("jrxDR/407/overhead/switches/aircon_fwd_lo_hi")
b407_startup_floats_armed 		= find_dataref("jrxDR/407/overhead/switches/floats_armed")
b407_startup_att_power 			= find_dataref("jrxDR/407/overhead/switches/att_gyro_power")
b407_startup_tb 				= find_dataref("jrxDR/407/overhead/switches/tb")
b407_startup_flir 				= find_dataref("jrxDR/407/overhead/switches/flir")
b407_startup_rad_alt_power 		= find_dataref("jrxDR/407/overhead/switches/rad_alt_power")
b407_start_up_rad_alt_bug		= find_dataref("sim/cockpit2/gauges/actuators/radio_altimeter_bug_ft_pilot")
b407_start_up_dme_power			= find_dataref("sim/cockpit2/radios/actuators/DME_slave_source")
b407_start_up_hsi_source		= find_dataref("sim/cockpit2/radios/actuators/HSI_source_select_pilot")
b407_start_up_fadec_cover		= find_dataref("jrxDR/407/panels/switches/fadec_cover")
b407_start_up_fadec_power		= find_dataref("sim/cockpit2/engine/actuators/fadec_on[0]")
b407_start_up_gyro_f_s			= find_dataref("sim/cockpit/gyros/gyr_free_slaved[3]")
b407_start_up_compass_sync		= find_dataref("jrxDR/407/panels/switches/compass_sync_2")
b407_start_up_elt_power			= find_dataref("jrxDR/407/operation/elt_switch")
-- Radios
b407_startup_set_vol_mrk		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_mark")
b407_startup_set_vol_com1		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_com1")
b407_startup_set_vol_com2		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_com2")
b407_startup_set_vol_nav1		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_nav1")
b407_startup_set_vol_nav2		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_nav2")
b407_startup_set_vol_adf1		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_adf1")
b407_startup_set_vol_adf2		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_adf2")
b407_startup_set_vol_dme1		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_dme1")
b407_startup_set_vol_dme2		= find_dataref("sim/cockpit2/radios/actuators/audio_volume_dme2")
b407_startup_set_com_sel		= find_dataref("sim/cockpit2/radios/actuators/audio_com_selection")
b407_startup_radio_volume		= find_dataref("sim/operation/sound/radio_volume_ratio")
b407_startup_set_com1_sw		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_com1")
b407_startup_set_power_nav1		= find_dataref("sim/cockpit2/radios/actuators/nav1_power")
b407_startup_set_power_nav2		= find_dataref("sim/cockpit2/radios/actuators/nav2_power")
b407_startup_sw_com2			= find_dataref("sim/cockpit2/radios/actuators/com2_power")
b407_startup_sw_adf1			= find_dataref("sim/cockpit2/radios/actuators/adf1_power")
b407_startup_sw_com1			= find_dataref("sim/cockpit2/radios/actuators/com1_power")
-- Lighting
b407_startup_pulse_lights 		= find_dataref("jrxDR/407/lighting/exterior/pulse_lights_switch")
b407_startup_sw_landing_l		= find_dataref("jrxDR/407/panels/switches/landing_lights")
b407_startup_sw_nav_l			= find_dataref("sim/cockpit2/switches/navigation_lights_on")
b407_startup_sw_strobe			= find_dataref("sim/cockpit2/switches/strobe_lights_on")
b407_startup_dim_annun 			= find_dataref("jrxDR/407/panels/switches/annun_dim") -- value = 2
b407_startup_cabin_lights 		= find_dataref("jrxDR/407/overhead/switches/cabin_lights")
b407_startup_inst_bright 		= find_dataref("sim/cockpit2/switches/instrument_brightness_ratio[0]")
b407_startup_logo_lights 		= find_dataref("sim/cockpit2/switches/generic_lights_switch[3]")
b407_start_up_panel_bright_w	= find_dataref("sim/cockpit2/switches/instrument_brightness_ratio[1]")
b407_start_up_panel_bright_g	= find_dataref("sim/cockpit2/switches/instrument_brightness_ratio[2]")
b407_startup_sw_acol_l			= find_dataref("sim/cockpit2/switches/beacon_on")

-- Function Manual Starting
function manual_starting()
	if b407_startup_starter_sw == 1 then
		if b407_startup_set_rbf == 0 then
			if b407_startup_set_rotor_brake	== 0 then
				if b407_startup_bus_volts >= 24 then
					b407_startup_timer_on = 1
				end
			end
		end
	end

	if b407_startup_timer_value >= 0.2 and b407_startup_timer_value <= 0.699 then
		b407_startup_starter_key = 4
		b407_startup_ignition_on = 1
	end
	
	if b407_startup_timer_value >= 0.700 then
		b407_startup_timer_on = 0
		b407_startup_starter_key = 3
		b407_startup_ignition_on = 0
	end
end
-- Function Auto-Start
function start_auto()

	if b407_startup_auto == 1 then
	
	auto_start_triggered = true
	
		b407_startup_starter_sw			= 1
		b407_startup_set_rbf			= 0
		b407_startup_set_rotor_brake	= 0
		b407_startup_fuel_load_0		= 275.784
		b407_startup_fuel_load_1		= 118.388
		b407_startup_collective_lock	= 0
		b407_startup_cyclic_lock		= 0
		b407_startup_battery 			= 1
		b407_startup_hyd_pump 			= 1
		b407_start_up_fuel_switch		= 1
		b407_start_up_fuel_cover		= 0
		b407_startup_fuel_pump_0 		= 1
		b407_startup_fuel_pump_1 		= 1
		b407_startup_sw_gen_0			= 0
		b407_starter_fuel_on_0			= 1
		b407_startup_sw_pitot_0			= 0
		b407_startup_anti_ice 			= 0
		b407_startup_Part_sep 			= 0
		b407_startup_avionics	 		= 1
		b407_startup_heater 			= 0
		b407_startup_defog 				= 0
		b407_startup_elec_trim 			= 0
		b407_startup_trim_power 		= 0
		b407_startup_air_cond 			= 0
		b407_startup_air_cond_set 		= 0
		b407_startup_floats_armed 		= 0
		b407_startup_att_power 			= 0
		b407_startup_tb 				= 0
		b407_startup_flir 				= 0
		b407_startup_rad_alt_power 		= 0
		b407_start_up_rad_alt_bug		= 0
		b407_start_up_dme_power			= 0
		b407_start_up_hsi_source		= 0
		b407_start_up_fadec_cover		= 0
		b407_start_up_fadec_power		= 1
		b407_start_up_gyro_f_s			= 0
		b407_start_up_compass_sync		= 0
		b407_start_up_elt_power			= 0
		b407_startup_set_vol_mrk		= 1
		b407_startup_set_vol_com1		= 1
		b407_startup_set_vol_com2		= 1
		b407_startup_set_vol_nav1		= 1
		b407_startup_set_vol_nav2		= 1
		b407_startup_set_vol_adf1		= 1
		b407_startup_set_vol_adf2		= 1
		b407_startup_set_vol_dme1		= 1
		b407_startup_set_vol_dme2		= 1
		b407_startup_set_com_sel		= 1
		b407_startup_radio_volume		= 1
		b407_startup_set_com1_sw		= 1
		b407_startup_set_power_nav1		= 0
		b407_startup_set_power_nav2		= 0
		b407_startup_sw_com2			= 0
		b407_startup_sw_adf1			= 0
		b407_startup_sw_com1			= 0
		b407_startup_pulse_lights 		= 0
		b407_startup_sw_landing_l		= 0
		b407_startup_sw_nav_l			= 0
		b407_startup_sw_strobe			= 0
		b407_startup_dim_annun 			= 0
		b407_startup_cabin_lights 		= 0
		b407_startup_inst_bright 		= 0.2
		b407_startup_logo_lights 		= 0
		b407_start_up_panel_bright_w	= 0
		b407_start_up_panel_bright_g	= 0
		b407_startup_sw_acol_l			= 1

	end
	
	if auto_start_triggered  then			-- Items to come on / off when auto-start has ended
	
		if b407_startup_auto == 0 then
			
		b407_startup_starter_sw			= 0
		b407_startup_set_rbf			= 0
		b407_startup_set_rotor_brake	= 0
		b407_startup_fuel_load_0		= 275.784
		b407_startup_fuel_load_1		= 118.388
		b407_startup_collective_lock	= 0
		b407_startup_cyclic_lock		= 0
		b407_startup_battery 			= 1
		b407_startup_hyd_pump 			= 1
		b407_start_up_fuel_switch		= 1
		b407_start_up_fuel_cover		= 0
		b407_startup_fuel_pump_0 		= 1
		b407_startup_fuel_pump_1 		= 1
		b407_startup_sw_gen_0			= 1
		b407_starter_fuel_on_0			= 1
		b407_startup_sw_pitot_0			= 1
		b407_startup_anti_ice 			= 1
		b407_startup_Part_sep 			= 1
		b407_startup_avionics	 		= 1
		b407_startup_heater 			= 1
		b407_startup_defog 				= 1
		b407_startup_elec_trim 			= 1
		b407_startup_trim_power 		= 1
		b407_startup_air_cond 			= 1
		b407_startup_air_cond_set 		= 1
		b407_startup_floats_armed 		= 0
		b407_startup_att_power 			= 1
		b407_startup_tb 				= 0
		b407_startup_flir 				= 0
		b407_startup_rad_alt_power 		= 1
		b407_start_up_rad_alt_bug		= 50
		b407_start_up_dme_power			= 1
		b407_start_up_hsi_source		= 1
		b407_start_up_fadec_cover		= 0
		b407_start_up_fadec_power		= 1
		b407_start_up_gyro_f_s			= 1
		b407_start_up_compass_sync		= 1
		b407_start_up_elt_power			= 1
		b407_startup_set_vol_mrk		= 1
		b407_startup_set_vol_com1		= 1
		b407_startup_set_vol_com2		= 1
		b407_startup_set_vol_nav1		= 1
		b407_startup_set_vol_nav2		= 1
		b407_startup_set_vol_adf1		= 1
		b407_startup_set_vol_adf2		= 1
		b407_startup_set_vol_dme1		= 1
		b407_startup_set_vol_dme2		= 1
		b407_startup_set_com_sel		= 1
		b407_startup_radio_volume		= 1
		b407_startup_set_com1_sw		= 1
		b407_startup_set_power_nav1		= 1
		b407_startup_set_power_nav2		= 1
		b407_startup_sw_com2			= 1
		b407_startup_sw_adf1			= 2
		b407_startup_sw_com1			= 1
		b407_startup_pulse_lights 		= 1
		b407_startup_sw_landing_l		= 2
		b407_startup_sw_nav_l			= 1
		b407_startup_sw_strobe			= 1
		b407_startup_dim_annun 			= 0
		b407_startup_cabin_lights 		= 0
		b407_startup_inst_bright 		= 0.9
		b407_startup_logo_lights 		= 1
		b407_start_up_panel_bright_w	= 0.002
		b407_start_up_panel_bright_g	= 0
		b407_startup_sw_acol_l			= 1
			
			auto_start_triggered 			= false
			
		end
	end
end
-- Function - Start-up Running from Load
--function start_ready_to_fly()
--
--	if b407_startup_running == 1 then
--	
--		b407_startup_set_rbf			= 0
--		b407_startup_set_rotor_brake	= 0
--		b407_startup_fuel_load_0		= 275.784
--		b407_startup_fuel_load_1		= 118.388
--		b407_startup_collective_lock	= 0
--		b407_startup_cyclic_lock		= 0
--		b407_startup_battery 			= 1
--		b407_startup_hyd_pump 			= 1
--		b407_start_up_fuel_switch		= 1
--		b407_start_up_fuel_cover		= 0
--		b407_startup_fuel_pump_0 		= 1
--		b407_startup_fuel_pump_1 		= 1
--		b407_startup_sw_gen_0			= 1
--		b407_starter_fuel_on_0			= 1
--		b407_startup_sw_pitot_0			= 1
--		b407_startup_anti_ice 			= 1
--		b407_startup_Part_sep 			= 1
--		b407_startup_avionics	 		= 1
--		b407_startup_heater 			= 1
--		b407_startup_defog 				= 1
--		b407_startup_elec_trim 			= 1
--		b407_startup_trim_power 		= 1
--		b407_startup_air_cond 			= 1
--		b407_startup_air_cond_set 		= 1
--		b407_startup_floats_armed 		= 0
--		b407_startup_att_power 			= 1
--		b407_startup_tb 				= 0
--		b407_startup_flir 				= 0
--		b407_startup_rad_alt_power 		= 1
--		b407_start_up_rad_alt_bug		= 50
--		b407_start_up_dme_power			= 1
--		b407_start_up_hsi_source		= 1
--		b407_start_up_fadec_cover		= 0
--		b407_start_up_fadec_power		= 1
--		b407_start_up_gyro_f_s			= 1
--		b407_start_up_compass_sync		= 1
--		b407_start_up_elt_power			= 1
--		b407_startup_set_vol_mrk		= 1
--		b407_startup_set_vol_com1		= 1
--		b407_startup_set_vol_com2		= 1
--		b407_startup_set_vol_nav1		= 1
--		b407_startup_set_vol_nav2		= 1
--		b407_startup_set_vol_adf1		= 1
--		b407_startup_set_vol_adf2		= 1
--		b407_startup_set_vol_dme1		= 1
--		b407_startup_set_vol_dme2		= 1
--		b407_startup_set_com_sel		= 1
--		b407_startup_radio_volume		= 1
--		b407_startup_set_com1_sw		= 1
--		b407_startup_set_power_nav1		= 1
--		b407_startup_set_power_nav2		= 1
--		b407_startup_sw_com2			= 1
--		b407_startup_sw_adf1			= 1
--		b407_startup_sw_com1			= 1
--		b407_startup_pulse_lights 		= 1
--		b407_startup_sw_landing_l		= 2
--		b407_startup_sw_nav_l			= 1
--		b407_startup_sw_strobe			= 1
--		b407_startup_dim_annun 			= 0
--		b407_startup_cabin_lights 		= 0
--		b407_startup_inst_bright 		= 0.9
--		b407_startup_logo_lights 		= 1
--		b407_start_up_panel_bright_w	= 0.002
--		b407_start_up_panel_bright_g	= 0
--		b407_startup_sw_acol_l			= 1
--	
--	b407_startup_running				= true
--
--	end
--end
-- Run the Logic
--function flight_start()
	--start_ready_to_fly()
--end

--function aircraft_load()
--
--end

function after_physics()
	start_auto()
	manual_starting()
	b407_startup_park_b_0 		= 1
	b407_startup_park_b_1 		= 1
	b407_startup_park_b_2 		= 1
	b407_startup_park_b_3 		= 1
	b407_startup_park_b_4 		= 1
	b407_startup_park_b_5 		= 1
	b407_startup_park_b_6 		= 1
	b407_startup_park_b_7 		= 1
	b407_startup_park_b_8 		= 1
end

function after_replay()
	start_auto()
	manual_starting()
	b407_startup_park_b_0 		= 1
	b407_startup_park_b_1 		= 1
	b407_startup_park_b_2 		= 1
	b407_startup_park_b_3 		= 1
	b407_startup_park_b_4 		= 1
	b407_startup_park_b_5 		= 1
	b407_startup_park_b_6 		= 1
	b407_startup_park_b_7 		= 1
	b407_startup_park_b_8 		= 1
end