-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- © JRX Design - JRX BELL 407 (22) - EXTERNAL LIGHTING    --------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Local Variables
local timer_0 = 0
local timer_1 = 0
local timer_2 = 0
local timer_3 = 0
-- Custom DATAREFS
lighting_ext_pulse_left				= find_dataref("jrxDR/407/lighting/exterior/pulse_lights_left")
lighting_ext_pulse_right	 		= find_dataref("jrxDR/407/lighting/exterior/pulse_lights_right")
lighting_ext_pulse_switch			= find_dataref("jrxDR/407/lighting/exterior/pulse_lights_switch")
lighting_ext_logo_switc				= find_dataref("jrxDR/407/lighting/exterior/logo_lights")
-- Standard DATAREFS		
lighting_ext_power					= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
lighting_ext_generic_lights_switch	= find_dataref("sim/cockpit2/switches/generic_lights_switch")
lighting_ext_override				= find_dataref("sim/flightmodel2/lights/override_beacons_and_strobes")
lighting_ext_beacon					= find_dataref("sim/flightmodel2/lights/beacon_brightness_ratio")
lighting_ext_beacon_sw				= find_dataref("sim/cockpit2/switches/beacon_on")
lighting_ext_strobe_on				= find_dataref("sim/graphics/animation/lights/airplane_strobe_light")
lighting_ext_strobe_sw				= find_dataref("sim/cockpit2/switches/strobe_lights_on")
lighting_ext_strobe					= find_dataref("sim/flightmodel2/lights/strobe_brightness_ratio")
lighting_ext_pulse_bright			= find_dataref("sim/flightmodel2/lights/generic_lights_brightness_ratio")
-- Logic For Logo Lights
function logo_lights()
	if lighting_ext_power >= 10 then
		if lighting_ext_logo_switch == 1 then
				lighting_ext_generic_lights_switch[3] = 1
		elseif lighting_ext_power >= 10 then
			if lighting_ext_logo_switch == 0 then
					lighting_ext_generic_lights_switch[3] = 0
			end
		end
	end
end
-- Logic For Custom Light Timing - Strobes
function custom_lighting_strobes()
	lighting_ext_override = 1
	timer_1 = timer_1 + 6 * SIM_PERIOD
	if lighting_ext_power >= 10 and lighting_ext_strobe_sw == 1 then
		if timer_1  >= 10 then
			timer_1 = timer_1 - 10
		end
		if timer_1 > 0 and timer_1 < 0.4 then
			lighting_ext_strobe[0] = 1
		elseif timer_1 > 0.8 and timer_1 < 1.2 then
			lighting_ext_strobe[0] = 1
		elseif timer_1 > 1.6 and timer_1 < 2.0 then
			lighting_ext_strobe[0] = 1
		elseif timer_1 > 5.0 and timer_1 < 6.2 then
			lighting_ext_strobe[1] = 1
		else
			lighting_ext_strobe[0] = 0
			lighting_ext_strobe[1] = 0
		end
	end
	if lighting_ext_power <= 10 then
			lighting_ext_strobe[0] = 0
			lighting_ext_strobe[1] = 0
	end
	if lighting_ext_strobe_sw == 0 then
			lighting_ext_strobe[0] = 0
			lighting_ext_strobe[1] = 0
	end
end
-- Logic For Custom Light Timing - Beacons
function custom_lighting_beacons()
	timer_0 = timer_0 + 3 * SIM_PERIOD
	if lighting_ext_power >= 10 and lighting_ext_beacon_sw == 1 then
		if timer_0  >= 3 then
			timer_0 = timer_0 - 3
		end
		if timer_0 > 0.9 and timer_0 < 1.8 then
			lighting_ext_beacon[0] = 2.5
		else
			lighting_ext_beacon[0] = 0
		end
		if timer_0 > 0 and timer_0 < 0.9 then
			lighting_ext_beacon[1] = 2.5
		else
			lighting_ext_beacon[1] = 0
		end
	end
	if lighting_ext_power <= 10 then
			lighting_ext_beacon[0] = 0
			lighting_ext_beacon[1] = 0
	end
	if lighting_ext_beacon_sw == 0 then
			lighting_ext_beacon[0] = 0
			lighting_ext_beacon[1] = 0
	end
end
-- Logic For Custom Pulse Lighting
function pulse_lights()
	timer_2 = timer_2 + 2.5 * SIM_PERIOD
	if lighting_ext_power >= 10 and lighting_ext_pulse_switch == 1 then
		if timer_2 >= 2 then
			timer_2 = timer_2 - 2
		end
		if timer_2 > 0.0 and timer_2 < 1.0 then
			lighting_ext_pulse_left = 0
			lighting_ext_generic_lights_switch[0] = 0
		else
			lighting_ext_pulse_left = 1
			lighting_ext_generic_lights_switch[0] = 1
		end
		if timer_2 > 1.0 and timer_2 < 2.0 then
			lighting_ext_pulse_right = 0
			lighting_ext_generic_lights_switch[1] = 0
		else
			lighting_ext_pulse_right = 1
			lighting_ext_generic_lights_switch[1] = 1
		end
	end
	if lighting_ext_power <= 10 then
			lighting_ext_pulse_right = 0
			lighting_ext_pulse_left = 0
			lighting_ext_generic_lights_switch[0] = 0
			lighting_ext_generic_lights_switch[1] = 0
	end
	if lighting_ext_pulse_switch == 0 then
			lighting_ext_pulse_right = 0
			lighting_ext_pulse_left = 0
			lighting_ext_generic_lights_switch[0] = 0
			lighting_ext_generic_lights_switch[1] = 0
			--lighting_ext_pulse_bright[0] = 0
			--lighting_ext_pulse_bright[1] = 0
	end
end
-- Run The Logic
function after_physics()
logo_lights()
custom_lighting_strobes()
custom_lighting_beacons()
pulse_lights()
end
function after_replay()
logo_lights()
custom_lighting_strobes()
custom_lighting_beacons()
pulse_lights()
end