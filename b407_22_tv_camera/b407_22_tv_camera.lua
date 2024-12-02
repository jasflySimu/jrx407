------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (24) Custom Camera Module -------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display for Camera Screen Updating position
simDR_latitude 			= find_dataref("sim/flightmodel/position/latitude")
simDR_time_sec 			= find_dataref("sim/time/total_flight_time_sec")
simDR_longitude 		= find_dataref("sim/flightmodel/position/longitude")
jrxDR_latitude_deg		= create_dataref("jrxDR/407/position/latitude_deg", "number")
jrxDR_longitude_deg		= create_dataref("jrxDR/407/position/longitude_deg", "number")
jrxDR_longitude_min		= create_dataref("jrxDR/407/position/longitude_min", "number")
jrxDR_latitude_min 		= create_dataref("jrxDR/407/position/latitude_min", "number")
jrxDR_longitude_min_tgt	= create_dataref("jrxDR/407/position/longitude_min_tgt", "number")
jrxDR_latitude_min_tgt 	= create_dataref("jrxDR/407/position/latitude_min_tgt", "number")
-- B407 Find Custom Datarefs
dr_b407_camera_option_on_off    =find_dataref("jrxDR/407/overhead/switches/tb")
---- Custom Dataref Creation
function b407_show_hide_camera() end
dr_b407_show_hide_camera 			= create_dataref("jrxDR/407/config/show_hide_camera", "number", b407_show_hide_camera)
function b407_camera_configuration_power() end
dr_b407_camera_configuration_power 	= create_dataref("jrxDR/407/config/camera_power", "number", b407_camera_configuration_power)
function b407_camera_control_park() end
dr_b407_camera_control_park			= create_dataref("jrxDR/407/camera/control/park", "number", b407_camera_control_park)
function b407_camera_control_reset() end
dr_b407_camera_control_reset 		= create_dataref("jrxDR/407/camera/control/reset", "number", b407_camera_control_reset)
function b407_camera_control_mode() end
dr_b407_camera_control_mode 		= create_dataref("jrxDR/407/camera/control/mode", "number", b407_camera_control_mode)
function b407_camera_heading_numerals() end
dr_camera_heading_numerals 			= create_dataref("jrxDR/407/config/camera_heading_numerals", "number", b407_camera_heading_numerals)
function b407_camera_zoom_numerals() end
dr_camera_zoom_numerals 			= create_dataref("jrxDR/407/config/camera_zoom_numerals", "number", b407_camera_zoom_numerals)
-- B407 Find Camera Datarefs
dr_b407_camera_offset_pitch     =find_dataref("sim/cockpit2/camera/camera_offset_pitch")	
dr_b407_camera_offset_heading   =find_dataref("sim/cockpit2/camera/camera_offset_heading")
dr_b407_camera_offset_roll      =find_dataref("sim/cockpit2/camera/camera_offset_roll")	
dr_b407_camera_offset_fov		= find_dataref("sim/cockpit2/camera/camera_field_of_view")
dr_b407_camera_power_on       	=find_dataref("sim/cockpit2/switches/camera_power_on")
dr_b407_camera_bus_volts		= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
-- Timers
simDR_slider_on_0 				= find_dataref("sim/cockpit2/switches/custom_slider_on[0]")
simDR_slider_on_1 				= find_dataref("sim/cockpit2/switches/custom_slider_on[1]")
simDR_slider_ratio_0 			= find_dataref("sim/flightmodel2/misc/custom_slider_ratio[0]")
simDR_slider_ratio_1 			= find_dataref("sim/flightmodel2/misc/custom_slider_ratio[1]")

function latitude()
jrxDR_latitude_min_tgt = jrxDR_latitude_min + dr_b407_camera_offset_heading / 1000
local lat = (math.abs(simDR_latitude))
local lat_deg = (math.floor(lat))
local lat_min_dec = lat
local lat_min_dec2 = (string.format("%6.6f", lat_min_dec))
jrxDR_latitude_deg = lat_deg
jrxDR_latitude_min = lat_min_dec2
end
--
function longitude()
jrxDR_longitude_min_tgt = jrxDR_longitude_min + dr_b407_camera_offset_heading / 1000
local lon = (math.abs(simDR_longitude))
local lon_deg = (math.floor(lon))
local lon_min_dec = lon --(math.fmod(lon,1.0)*600)
local lon_min_dec2 = (string.format("%6.3f", lon_min_dec))
jrxDR_longitude_deg = lon_deg
jrxDR_longitude_min = lon_min_dec2
end
-- Commands
-- Heading Control Positive
function camera_control_heading_pos(phase, duration)
local move_camera_right = 0.5
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_heading = dr_b407_camera_offset_heading + move_camera_right
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_pos, 0)
b407_camera_control_heading_pos		= create_command("407/Switches/Controls/camera/heading_2_r", "JRX B407 - Switch - Camera - Heading - Right →", camera_control_heading_pos)
-- Heading Control Negative
function camera_control_heading_neg(phase, duration)
local move_camera_left = 0.5
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_heading = dr_b407_camera_offset_heading - move_camera_left
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_neg, 0)
b407_camera_control_heading_neg		= create_command("407/Switches/Controls/camera/heading_1_l", "JRX B407 - Switch - Camera - Heading - Left ←", camera_control_heading_neg)
-- Heading Control Up
function camera_control_heading_up(phase, duration)
local move_camera_up = 0.5
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_pitch = dr_b407_camera_offset_pitch + move_camera_up
					if dr_b407_camera_offset_pitch >= 16 then
							dr_b407_camera_offset_pitch = 16
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_up, 0)
b407_camera_control_heading_up		= create_command("407/Switches/Controls/camera/heading_3_u", "JRX B407 - Switch - Camera - Heading - Up ↑", camera_control_heading_up)
-- Heading Control Dn
function camera_control_heading_dn(phase, duration)
local move_camera_dn = 0.5
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_pitch = dr_b407_camera_offset_pitch - move_camera_dn
					if dr_b407_camera_offset_pitch <= -90 then
							dr_b407_camera_offset_pitch = -90
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_dn, 0)
b407_camera_control_heading_dn		= create_command("407/Switches/Controls/camera/heading_4_d", "JRX B407 - Switch - Camera - Heading - Down ↓", camera_control_heading_dn)
-- Heading Control Zoom +
function camera_control_heading_zoom_in(phase, duration)
local move_camera_zi = 0.4
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_fov = dr_b407_camera_offset_fov - move_camera_zi
					if dr_b407_camera_offset_fov <= 1 then
							dr_b407_camera_offset_fov = 1
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_zoom_in, 0)
b407_camera_control_heading_zoom_in		= create_command("407/Switches/Controls/camera/heading_5_zi", "JRX B407 - Switch - Camera - Heading - Zoom In → ← ", camera_control_heading_zoom_in)
-- Heading Control Zoom -
function camera_control_heading_zoom_out(phase, duration)
local move_camera_zo = 0.4
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_fov = dr_b407_camera_offset_fov + move_camera_zo
					if dr_b407_camera_offset_fov >= 100 then
							dr_b407_camera_offset_fov = 100
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_zoom_out, 0)
b407_camera_control_heading_zoom_out		= create_command("407/Switches/Controls/camera/heading_6_zo", "JRX B407 - Switch - Camera - Heading - Zoom Out ← →", camera_control_heading_zoom_out)
-- Heading Control Roll -
function camera_control_heading_roll_left(phase, duration)
local move_camera_roll_left = 0.4
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_roll = dr_b407_camera_offset_roll - move_camera_roll_left
					if dr_b407_camera_offset_roll <= -90 then
							dr_b407_camera_offset_roll = -90
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_roll_left, 0)
b407_camera_control_heading_roll_left		= create_command("407/Switches/Controls/camera/heading_7_rl", "JRX B407 - Switch - Camera - Heading - Roll Left ←←", camera_control_heading_roll_left)
-- Heading Control Roll +
function camera_control_heading_roll_right(phase, duration)
local move_camera_roll_right = 0.4
	if phase == 1 then
		if dr_b407_camera_bus_volts >= 10 then
			if dr_b407_show_hide_camera == 2 then
				if dr_b407_camera_configuration_power == 2 then
					dr_b407_camera_offset_roll = dr_b407_camera_offset_roll + move_camera_roll_right
					if dr_b407_camera_offset_roll >= 90 then
							dr_b407_camera_offset_roll = 90
					end	
				end
			end
		end
	end
end
run_at_interval(camera_control_heading_roll_right, 0)
b407_camera_control_heading_roll_right		= create_command("407/Switches/Controls/camera/heading_8_rr", "JRX B407 - Switch - Camera - Heading - Roll Right →→", camera_control_heading_roll_right)
-- Show the Camera System and ensure it is off when hidden.
function show_hide_camera_system()
	if dr_b407_camera_option_on_off == 1 then
		dr_b407_show_hide_camera = 2
		dr_b407_camera_power_on = dr_b407_camera_power_on
		dr_b407_camera_configuration_power = dr_b407_camera_configuration_power
	end
	if dr_b407_camera_option_on_off == 0 then
		if dr_b407_camera_power_on == 1 then
			dr_b407_show_hide_camera 			= 0
			dr_b407_camera_power_on  			= 0
			dr_b407_camera_configuration_power 	= 0
		end
	end
	if dr_b407_camera_option_on_off == 0 then
		if dr_b407_camera_power_on == 0 then
			dr_b407_show_hide_camera 			= 0
			dr_b407_camera_power_on  			= 0
			dr_b407_camera_configuration_power 	= 0
		end
	end
	if dr_b407_camera_configuration_power == 2 then
		dr_b407_camera_power_on = 1
	else
		dr_b407_camera_power_on = 0
	end
end
-- Run the Logic
function after_physics()
latitude()
longitude()
show_hide_camera_system()
end
function after_replay()
latitude()
longitude()
show_hide_camera_system()
end
function flight_start()
dr_b407_camera_offset_pitch		= 6
dr_b407_camera_offset_heading	= 0
dr_b407_camera_offset_roll		= 0
dr_b407_camera_offset_fov		= 47
end