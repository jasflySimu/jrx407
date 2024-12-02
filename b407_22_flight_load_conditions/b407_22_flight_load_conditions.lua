-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- © JRX Design - JRX BELL 407 (22) - FLIGHT LOAD CONDITIONS    ---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Set all CBs to ON at flight load
flight_load_cb_01 = find_dataref("jrxDR/407/panels/switches/cb_01")
flight_load_cb_02 = find_dataref("jrxDR/407/panels/switches/cb_02")
flight_load_cb_03 = find_dataref("jrxDR/407/panels/switches/cb_03")
flight_load_cb_04 = find_dataref("jrxDR/407/panels/switches/cb_04")
flight_load_cb_05 = find_dataref("jrxDR/407/panels/switches/cb_05")
flight_load_cb_06 = find_dataref("jrxDR/407/panels/switches/cb_06")
flight_load_cb_07 = find_dataref("jrxDR/407/panels/switches/cb_07")
flight_load_cb_08 = find_dataref("jrxDR/407/panels/switches/cb_08")
flight_load_cb_09 = find_dataref("jrxDR/407/panels/switches/cb_09")
flight_load_cb_10 = find_dataref("jrxDR/407/panels/switches/cb_10")
flight_load_cb_11 = find_dataref("jrxDR/407/panels/switches/cb_11")
flight_load_cb_12 = find_dataref("jrxDR/407/panels/switches/cb_12")
flight_load_cb_13 = find_dataref("jrxDR/407/panels/switches/cb_13")
flight_load_cb_14 = find_dataref("jrxDR/407/panels/switches/cb_14")
flight_load_cb_15 = find_dataref("jrxDR/407/panels/switches/cb_15")
flight_load_cb_16 = find_dataref("jrxDR/407/panels/switches/cb_16")
flight_load_cb_17 = find_dataref("jrxDR/407/panels/switches/cb_17")
flight_load_cb_18 = find_dataref("jrxDR/407/panels/switches/cb_18")
flight_load_cb_19 = find_dataref("jrxDR/407/panels/switches/cb_19")
flight_load_cb_20 = find_dataref("jrxDR/407/panels/switches/cb_20")
flight_load_cb_21 = find_dataref("jrxDR/407/panels/switches/cb_21")
flight_load_cb_22 = find_dataref("jrxDR/407/panels/switches/cb_22")
flight_load_cb_23 = find_dataref("jrxDR/407/panels/switches/cb_23")
flight_load_cb_24 = find_dataref("jrxDR/407/panels/switches/cb_24")
flight_load_cb_25 = find_dataref("jrxDR/407/panels/switches/cb_25")
flight_load_cb_26 = find_dataref("jrxDR/407/panels/switches/cb_26")
flight_load_cb_27 = find_dataref("jrxDR/407/panels/switches/cb_27")
flight_load_cb_28 = find_dataref("jrxDR/407/panels/switches/cb_28")
flight_load_cb_29 = find_dataref("jrxDR/407/panels/switches/cb_29")
flight_load_cb_30 = find_dataref("jrxDR/407/panels/switches/cb_30")
flight_load_cb_31 = find_dataref("jrxDR/407/panels/switches/cb_31")
flight_load_cb_32 = find_dataref("jrxDR/407/panels/switches/cb_32")
flight_load_cb_33 = find_dataref("jrxDR/407/panels/switches/cb_33")
flight_load_cb_34 = find_dataref("jrxDR/407/panels/switches/cb_34")
flight_load_cb_35 = find_dataref("jrxDR/407/panels/switches/cb_35")
flight_load_cb_36 = find_dataref("jrxDR/407/panels/switches/cb_36")
flight_load_cb_37 = find_dataref("jrxDR/407/panels/switches/cb_37")
flight_load_cb_38 = find_dataref("jrxDR/407/panels/switches/cb_38")
flight_load_cb_39 = find_dataref("jrxDR/407/panels/switches/cb_39")
flight_load_cb_40 = find_dataref("jrxDR/407/panels/switches/cb_40")
flight_load_cb_41 = find_dataref("jrxDR/407/panels/switches/cb_41")
flight_load_cb_42 = find_dataref("jrxDR/407/panels/switches/cb_42")
flight_load_cb_43 = find_dataref("jrxDR/407/panels/switches/cb_43")
flight_load_cb_44 = find_dataref("jrxDR/407/panels/switches/cb_44")
flight_load_cb_45 = find_dataref("jrxDR/407/panels/switches/cb_45")
flight_load_cb_46 = find_dataref("jrxDR/407/panels/switches/cb_46")
flight_load_cb_47 = find_dataref("jrxDR/407/panels/switches/cb_47")
flight_load_cb_48 = find_dataref("jrxDR/407/panels/switches/cb_48")
flight_load_cb_49 = find_dataref("jrxDR/407/panels/switches/cb_49")
flight_load_cb_50 = find_dataref("jrxDR/407/panels/switches/cb_50")
flight_load_cb_51 = find_dataref("jrxDR/407/panels/switches/cb_51")
flight_load_cb_52 = find_dataref("jrxDR/407/panels/switches/cb_52")
flight_load_cb_53 = find_dataref("jrxDR/407/panels/switches/cb_53")
flight_load_cb_54 = find_dataref("jrxDR/407/panels/switches/cb_54")
flight_load_cb_55 = find_dataref("jrxDR/407/panels/switches/cb_55")
flight_load_cb_56 = find_dataref("jrxDR/407/panels/switches/cb_56")
flight_load_cb_57 = find_dataref("jrxDR/407/panels/switches/cb_57")
-- Avionics Switch	
avionics_switch_load	 		= find_dataref("sim/cockpit/electrical/avionics_on")
-- Instrument Brightness Switches
inst_bright_9_load	 			= find_dataref("sim/cockpit2/switches/instrument_brightness_ratio[9]")	-- Annunciators Locked ON
-- Annunciator DIM / NORMAL Switch
inst_sw_annun_load	 			= find_dataref("jrxDR/407/panels/switches/annun_dim")
-- Autopilot Mode
autopilot_mode_load				= find_dataref("sim/cockpit/autopilot/autopilot_mode")
-- COMM Power Switches / Volume
com1_switch_load				= find_dataref("sim/cockpit2/radios/actuators/com1_power")
com2_switch_load				= find_dataref("sim/cockpit2/radios/actuators/com2_power")
adf1_switch_load				= find_dataref("sim/cockpit2/radios/actuators/adf1_power")
com1_volume_load				= find_dataref("sim/cockpit2/radios/actuators/audio_volume_com1")
com2_volume_load				= find_dataref("sim/cockpit2/radios/actuators/audio_volume_com2")
adf1_volume_load				= find_dataref("sim/cockpit2/radios/actuators/audio_volume_adf1")
trans_switch_load				= find_dataref("jrxDR/407/panels/switches/transponder_power")
-- Audio Panel Functions
audio_panel_ics_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_ics")
audio_panel_tel_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_tel")
audio_panel_aux_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_aux")
audio_panel_mute_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_mute")
audio_panel_spr_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_spr")
audio_panel_pwr_load 		= find_dataref("jrxDR/407/panels/switches/audio_panel_pwr")
com1_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_com1")
com2_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_com2")
nav1_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_nav1")
nav2_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_nav2")
adf1_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_adf1")
adf2_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_selection_adf2")
mkr_audio_panel_load 		= find_dataref("sim/cockpit2/radios/actuators/audio_marker_enabled")
nav1_id_audio_panel_load 	= find_dataref("sim/cockpit2/radios/indicators/morse_id_tone_nav1")
nav2_id_audio_panel_load 	= find_dataref("sim/cockpit2/radios/indicators/morse_id_tone_nav2")
adf1_id_audio_panel_load 	= find_dataref("sim/cockpit2/radios/indicators/morse_id_tone_adf1")
adf2_id_audio_panel_load 	= find_dataref("sim/cockpit2/radios/indicators/morse_id_tone_adf2")
-- Transponder Mode Switch Functions
transponder_mode_load 		= find_dataref("sim/cockpit2/radios/actuators/transponder_mode")
-- Wheel Brakes
wheel_brake_0 		= find_dataref("sim/multiplayer/controls/parking_brake[0]")
wheel_brake_1 		= find_dataref("sim/multiplayer/controls/parking_brake[1]")
wheel_brake_2 		= find_dataref("sim/multiplayer/controls/parking_brake[2]")
wheel_brake_3 		= find_dataref("sim/multiplayer/controls/parking_brake[3]")
wheel_brake_4 		= find_dataref("sim/multiplayer/controls/parking_brake[4]")
wheel_brake_5 		= find_dataref("sim/multiplayer/controls/parking_brake[5]")
wheel_brake_ratio 	= find_dataref("sim/cockpit2/controls/parking_brake_ratio")

function audio_panel_power()
	if audio_panel_pwr_load == 0 then
		com1_audio_panel_load 			= 0
		com2_audio_panel_load 			= 0
		nav1_audio_panel_load 			= 0
		nav2_audio_panel_load 			= 0
		adf1_audio_panel_load 			= 0
		adf2_audio_panel_load 			= 0
		mkr_audio_panel_load 			= 0
		nav1_id_audio_panel_load 		= 0
		nav2_id_audio_panel_load 		= 0
		adf1_id_audio_panel_load 		= 0
		adf2_id_audio_panel_load 		= 0
		audio_panel_ics_load 			= 0
		audio_panel_tel_load 			= 0
		audio_panel_aux_load 			= 0
		audio_panel_mute_load 			= 0
		audio_panel_spr_load 			= 0
	else
		com1_audio_panel_load 			= com1_audio_panel_load
		com2_audio_panel_load 			= com2_audio_panel_load
		nav1_audio_panel_load 			= nav1_audio_panel_load
		nav2_audio_panel_load 			= nav2_audio_panel_load
		adf1_audio_panel_load 			= adf1_audio_panel_load
		adf2_audio_panel_load 			= adf2_audio_panel_load
		mkr_audio_panel_load 			= mkr_audio_panel_load
		nav1_id_audio_panel_load 		= nav1_id_audio_panel_load
		nav2_id_audio_panel_load 		= nav2_id_audio_panel_load
		adf1_id_audio_panel_load 		= adf1_id_audio_panel_load
		adf2_id_audio_panel_load 		= adf2_id_audio_panel_load
		audio_panel_ics_load 			= audio_panel_ics_load
		audio_panel_tel_load 			= audio_panel_tel_load
		audio_panel_aux_load 			= audio_panel_aux_load
		audio_panel_mute_load 			= audio_panel_mute_load
		audio_panel_spr_load 			= audio_panel_spr_load
	end
end
-- Function COM1 / Power / Volume Switch
function com1_power()
	if com1_volume_load ~= 0 then
		com1_switch_load = 1
	else
		com1_switch_load = 0
	end
end
-- Function COM2 / Power / Volume Switch
function com2_power()
	if com2_volume_load ~= 0 then
		com2_switch_load = 1
	else
		com2_switch_load = 0
	end
end
-- Function ADF1 / Power / Volume Switch
function adf1_power()
	if adf1_volume_load ~= 0 then
		adf1_switch_load = 2
	else
		adf1_switch_load = 0
	end
end		
-- Function to tie the AP with the Avionics Switch
function ap_avionics_switch()
	if avionics_switch_load == 0 then
		autopilot_mode_load = 0
	else
		autopilot_mode_load = autopilot_mode_load
	end
end
--
function flight_start()
audio_panel_pwr_load 	= 1
audio_panel_tel_load  	= 1
audio_panel_aux_load 	= 1
audio_panel_spr_load	= 1
trans_switch_load	 	= 1
flight_load_cb_01 		= 1
flight_load_cb_02 		= 1
flight_load_cb_03 		= 1
flight_load_cb_04 		= 1
flight_load_cb_05 		= 1
flight_load_cb_06 		= 1
flight_load_cb_07 		= 1
flight_load_cb_08 		= 1
flight_load_cb_09 		= 1
flight_load_cb_10 		= 1
flight_load_cb_11 		= 1
flight_load_cb_12 		= 1
flight_load_cb_13 		= 1
flight_load_cb_14 		= 1
flight_load_cb_15 		= 1
flight_load_cb_16 		= 1
flight_load_cb_17 		= 1
flight_load_cb_18 		= 1
flight_load_cb_19 		= 1
flight_load_cb_20 		= 1
flight_load_cb_21 		= 1
flight_load_cb_22 		= 1
flight_load_cb_23 		= 1
flight_load_cb_24 		= 1
flight_load_cb_25 		= 1
flight_load_cb_26 		= 1
flight_load_cb_27 		= 1
flight_load_cb_28 		= 1
flight_load_cb_29 		= 1
flight_load_cb_30 		= 1
flight_load_cb_31 		= 1
flight_load_cb_32 		= 1
flight_load_cb_33 		= 1
flight_load_cb_34 		= 1
flight_load_cb_35 		= 1
flight_load_cb_36 		= 1
flight_load_cb_37 		= 1
flight_load_cb_38 		= 1
flight_load_cb_39 		= 1
flight_load_cb_40 		= 1
flight_load_cb_41 		= 1
flight_load_cb_42 		= 1
flight_load_cb_43 		= 1
flight_load_cb_44 		= 1
flight_load_cb_45 		= 1
flight_load_cb_46 		= 1
flight_load_cb_47 		= 1
flight_load_cb_48 		= 1
flight_load_cb_49 		= 1
flight_load_cb_50 		= 1
flight_load_cb_51 		= 1
flight_load_cb_52 		= 1
flight_load_cb_53 		= 1
flight_load_cb_54 		= 1
flight_load_cb_55 		= 1
flight_load_cb_56 		= 1
flight_load_cb_57 		= 1
end

function after_physics()
com1_power()
com2_power()
adf1_power()
ap_avionics_switch()
audio_panel_power()
wheel_brake_0 = 1
wheel_brake_1 = 1
wheel_brake_2 = 1
wheel_brake_3 = 1
wheel_brake_4 = 1
wheel_brake_5 = 1
wheel_brake_ratio 	= 1
transponder_mode_load = trans_switch_load
inst_bright_9_load = 1.0
end

function after_replay()
com1_power()
com2_power()
adf1_power()
ap_avionics_switch()
audio_panel_power()
wheel_brake_0 = 1
wheel_brake_1 = 1
wheel_brake_2 = 1
wheel_brake_3 = 1
wheel_brake_4 = 1
wheel_brake_5 = 1
wheel_brake_ratio 	= 1
transponder_mode_load = trans_switch_load
inst_bright_9_load = 1.0
end