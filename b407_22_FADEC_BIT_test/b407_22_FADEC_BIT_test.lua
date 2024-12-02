------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) FADEC BIT TESTS ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Find Standard DATAREFS
dr_prop_speed_rpm			= find_dataref("sim/cockpit2/engine/indicators/prop_speed_rpm[0]")
dr_N2_driver				= find_dataref("sim/cockpit2/engine/indicators/N2_percent[0]")
dr_battery_sw				= find_dataref("sim/cockpit2/electrical/bus_volts[0]")
dr_itt_deg 					= find_dataref("jrxDR/407/engine/engn_itt_value")
dr_lcd_test_slider			= find_dataref("sim/cockpit2/switches/custom_slider_on[23]")
dr_weight_on_wheels			= find_dataref("sim/cockpit2/tcas/targets/position/weight_on_wheels[0]")
b407_BIT_burning_fuel		= find_dataref("sim/flightmodel2/engines/engine_is_burning_fuel[0]")
-- Find Custom DATAREFS
dr_prop_speed_pct			= find_dataref("jrxDR/407/engine/operation/prop_speed_rpm_pct")
dr_N2_speed_pct				= find_dataref("jrxDR/407/engine/operation/N2_speed_rpm_pct")
dr_lcd_test_button			= find_dataref("jrxDR/407/panels/switches/lcd_test")
dr_fadec_bit_running 		= find_dataref("jrxDR/407/engine/operation/fadec_bit")
dr_fadec_bit_not_running 	= find_dataref("jrxDR/407/engine/operation/fadec_bit_not_running")
dr_fadec_engine_out		 	= find_dataref("jrxDR/407/engine/operation/fadec_engine_out")
dr_fadec_flash_TRQ		 	= find_dataref("jrxDR/407/engine/operation/TRQ_flash")
dr_fadec_flash_MGT		 	= find_dataref("jrxDR/407/engine/operation/MGT_flash")
dr_fadec_flash_NG		 	= find_dataref("jrxDR/407/engine/operation/NG_flash")
dr_trq_pct 					= find_dataref("jrxDR/407/engine/trq_percent")
dr_trq_ecxeedance 			= find_dataref("jrxDR/407/engine/exceedance_value_TRQ")
dr_mgt_ecxeedance 			= find_dataref("jrxDR/407/engine/exceedance_value_MGT")
dr_ng0_ecxeedance 			= find_dataref("jrxDR/407/engine/exceedance_value_NG")
dr_trq_show_exc 			= find_dataref("jrxDR/407/engine/show_TRQ_exceedance")
dr_mgt_show_exc 			= find_dataref("jrxDR/407/engine/show_MGT_exceedance")
dr_ng0_show_exc 			= find_dataref("jrxDR/407/engine/show_NG0_exceedance")
dr_show_instr_annun_trq 	= find_dataref("jrxDR/407/engine/show_chk_instr_trq")
dr_show_instr_annun_mgt 	= find_dataref("jrxDR/407/engine/show_chk_instr_mgt")
dr_show_instr_annun_ng		= find_dataref("jrxDR/407/engine/show_chk_instr_ng")
dr_engn_has_exceeded_trq 	= find_dataref("jrxDR/407/engine/engn_has_exceeded_trq")
dr_engn_has_exceeded_mgt 	= find_dataref("jrxDR/407/engine/engn_has_exceeded_mgt")
dr_engn_has_exceeded_ng0 	= find_dataref("jrxDR/407/engine/engn_has_exceeded_ng0")
dr_engn_has_exceeded_trq_sh = find_dataref("jrxDR/407/engine/engn_has_exceeded_trq_sh")
dr_engn_has_exceeded_mgt_sh = find_dataref("jrxDR/407/engine/engn_has_exceeded_mgt_sh")
dr_engn_has_exceeded_ng0_sh = find_dataref("jrxDR/407/engine/engn_has_exceeded_ng0_sh")
dr_exceed_value_total 		= find_dataref("jrxDR/407/engine/engn_has_exceeded_value")
dr_lcd_test_btn				= find_dataref("jrxDR/407/panels/switches/lcd_test_button")
dr_n1_percent 				= find_dataref("jrxDR/407/engine/indicators/ng_value")
-- Global Variables
local timer_master			= 0
local timer_up				= 0
local timer_dn				= 107
local trq_flash				= 0
local mgt_flash				= 0
local ng_flash				= 0
local exceed_value_trq 		= 0
local exceed_value_mgt 		= 0
local exceed_value_ng0 		= 0
local show_trq_timer 		= 0
local show_mgt_timer 		= 0
local show_ng_timer 		= 0
local battery_on_timer 		= 0
-- LDC Tests - RPM Gauge
function lcd_test_rpm_n2_gauge()
	if dr_battery_sw >= 1 then
		if dr_prop_speed_rpm <= 3 then
			if dr_lcd_test_btn >= 1 then
				dr_lcd_test_slider = 1

			else
				dr_lcd_test_slider = 0
			end
		end
	end
end
-- Create a flag to display realtime exceedances TRQ MGT NG
function show_engine_exceedances_realtime()
	if dr_battery_sw >= 1 then
		battery_on_timer = battery_on_timer + 1 * SIM_PERIOD
	end
	if battery_on_timer >= 30 then
		battery_on_timer = 30
	end
	if battery_on_timer >= 30 then
		if dr_engn_has_exceeded_trq == 1 then
			show_trq_timer = show_trq_timer + 1 * SIM_PERIOD
		end
		if show_trq_timer >= 1 and show_trq_timer <= 12 then
			dr_engn_has_exceeded_trq_sh = 1						--Show for 11 seconds with annunciator
		else
			dr_engn_has_exceeded_trq_sh = 0
		end
		if show_trq_timer >= 15 then
			show_trq_timer = 15
		end
--
		if dr_engn_has_exceeded_mgt == 1 then
			show_mgt_timer = show_mgt_timer + 1 * SIM_PERIOD
		end
		if show_mgt_timer >= 1 and show_mgt_timer <= 12 then
			dr_engn_has_exceeded_mgt_sh = 1						--Show for 11 seconds with annunciator
		else
			dr_engn_has_exceeded_mgt_sh = 0
		end
		if show_mgt_timer >= 15 then
			show_mgt_timer = 15
		end
--
		if dr_engn_has_exceeded_ng0 == 1 then
			show_ng_timer = show_ng_timer + 1 * SIM_PERIOD
		end
		if show_ng_timer >= 1 and show_ng_timer <= 12 then
			dr_engn_has_exceeded_ng0_sh = 1						--Show for 11 seconds with annunciator
		else
			dr_engn_has_exceeded_ng0_sh = 0
		end
		if show_ng_timer >= 15 then
			show_ng_timer = 15
		end
	end
end
-- Create a flag to confirm exceedance has occured
function engine_exceedance_value()
local exceed_value_trq 		= 0
local exceed_value_mgt 		= 0
local exceed_value_ng0 		= 0
	if dr_battery_sw >= 1 then
		if dr_trq_ecxeedance >= 101.1 then
			exceed_value_trq = exceed_value_trq + 1
			dr_engn_has_exceeded_trq = 1
		else
			exceed_value_trq = 0
			dr_engn_has_exceeded_trq = 0
		end
		if dr_mgt_ecxeedance >= 779 then
			exceed_value_mgt = exceed_value_mgt + 1
			dr_engn_has_exceeded_mgt = 1
		else
			exceed_value_mgt = 0
			dr_engn_has_exceeded_mgt = 0
		end
		if dr_ng0_ecxeedance >= 107 then
			exceed_value_ng0 = exceed_value_ng0 + 1
			dr_engn_has_exceeded_ng0  = 1
		else
			exceed_value_ng0 = 0
			dr_engn_has_exceeded_ng0  = 0
		end
	end
	dr_exceed_value_total = exceed_value_trq + exceed_value_mgt + exceed_value_ng0
end
-- Display Exceedances after Battery ON for 11 seconds
function show_exceedances_after_eleven_s()
	if dr_battery_sw >=1 then
		if timer_master >= 17 then
			show_trq_on()
			show_mgt_on()
			show_ng0_on()
		end
	end
end
-- Display if TRQ has exceedance after Battery ON for 11 seconds
function show_trq_on()
	if timer_master <= 28 and dr_trq_ecxeedance >= 100.1 then
		dr_trq_show_exc = 1
		dr_show_instr_annun_trq = 1
	else
		dr_trq_show_exc = 0
		dr_show_instr_annun_trq = 0
	end
end
-- Display if MGT has exceedance after Battery ON for 11 seconds
function show_mgt_on()
	if timer_master <= 28 and dr_mgt_ecxeedance >= 779 then
		dr_mgt_show_exc = 1
		dr_show_instr_annun_mgt = 1
	else
		dr_mgt_show_exc = 0
		dr_show_instr_annun_mgt = 0
	end
end
-- Display if NG has exceedance after Battery ON for 11 seconds
function show_ng0_on()
	if timer_master <= 28 and dr_ng0_ecxeedance >= 107 then
		dr_ng0_show_exc = 1
		dr_show_instr_annun_ng = 1
	else
		dr_ng0_show_exc = 0
		dr_show_instr_annun_ng = 0
	end
end
-- Flash the NG Trend Arc Prior to an exceedance
function flash_NG_trend_arc()
	if dr_n1_percent >= 103 and dr_n1_percent <= 200 then
		ng_flash = math.ceil(ng_flash + 1.1 * SIM_PERIOD)
		dr_fadec_flash_NG = ng_flash
	elseif dr_n1_percent <= 103 then
		dr_fadec_flash_NG = 0
	end
	if ng_flash >= 100 then
		ng_flash = ng_flash - 100
	end
end
-- Flash the MGT Trend Arc Prior to an exceedance
function flash_MGT_trend_arc()
	if dr_itt_deg >= 727 and dr_itt_deg <= 2000 then
		mgt_flash = math.ceil(mgt_flash + 1.2 * SIM_PERIOD)
		dr_fadec_flash_MGT = mgt_flash
	elseif dr_itt_deg <= 727 then
		dr_fadec_flash_MGT = 0
	end
	if mgt_flash >= 100 then
		mgt_flash = mgt_flash - 100
	end
end
-- Flash the TRQ Trend Arc Prior to an exceedance
function flash_TRQ_trend_arc()
	if dr_trq_pct >= 94 and dr_trq_pct <= 150 then -- TRQ Trend ARC Flashes at these Values
		trq_flash = math.ceil(trq_flash + 0.9 * SIM_PERIOD)
		dr_fadec_flash_TRQ = trq_flash
	elseif dr_trq_pct <= 94 then
		dr_fadec_flash_TRQ = 0
	end
	if trq_flash >= 100 then
		trq_flash = trq_flash - 100
	end
end
-- Power on FADEC BIT Tests
function fadec_bit_battery_on()
	if dr_battery_sw >= 1 then
		if timer_master <= 28 then
			timer_master = timer_master + 1 * SIM_PERIOD
		end
	else
		timer_master = 0
	end
end
-- Power on FADEC BIT Tests
function master_timer_running()
    if timer_master >= 0 and timer_master <= 17 then
		dr_fadec_bit_not_running = 1
	else
		dr_fadec_bit_not_running = 0
	end
	if timer_master >= 4.3 and timer_master <= 6.7 then
		dr_lcd_test_button = 1
	else
		dr_lcd_test_button = 0
	end
	if timer_master >= 0 and timer_master <= 3 then
		dr_fadec_engine_out = 1
	elseif timer_master >= 8 and timer_master <= 11 then
		dr_fadec_engine_out = 1
	elseif timer_master >= 14 and timer_master <= 17 then
		dr_fadec_engine_out = 1
	else
		dr_fadec_engine_out = 0
	end
	if timer_master >= 3 and timer_master <= 8 then
		dr_lcd_test_button = 1
	else
		dr_lcd_test_button = 0
	end
	if timer_master >= 4.3 and timer_master <= 6.7 then
		dr_fadec_bit_running = 1
	elseif timer_master >= 10.4 and timer_master <= 11.6 then
		dr_fadec_bit_running = 1
	else
		dr_fadec_bit_running = 0
	end
end
-- Power on FADEC BIT Tests
function n2_rpm_animation()
	if timer_master >= 3 then
		timer_up = timer_up + 42.8 * SIM_PERIOD
		dr_prop_speed_pct = timer_up
		dr_N2_speed_pct = timer_up
	end
--------------------------------------------------------------------
	if timer_up >= 100.5 then
		dr_N2_speed_pct = 100.5
	end
	if timer_up >= 107 then
		dr_prop_speed_pct = 107
	end
--------------------------------------------------------------------
	if timer_master >= 11 then
		timer_dn = timer_dn - 42.8 * SIM_PERIOD
		dr_prop_speed_pct = timer_dn
	end
	if timer_dn <= 100.5 then
		dr_N2_speed_pct = timer_dn
	end
--------------------------------------------------------------------
	if timer_dn <= 1 then
		dr_prop_speed_pct = 0
		dr_N2_speed_pct = 0
	end
	if timer_master >= 28 then
		dr_prop_speed_pct = dr_prop_speed_rpm / 413 * 100
		dr_N2_speed_pct = dr_N2_driver
		timer_dn = 107
		timer_up = 0
	end
end	
-- Run the logic
function after_physics()
lcd_test_rpm_n2_gauge()
show_engine_exceedances_realtime()
engine_exceedance_value()
show_exceedances_after_eleven_s()
flash_NG_trend_arc()
flash_MGT_trend_arc()
flash_TRQ_trend_arc()
n2_rpm_animation()
fadec_bit_battery_on()
master_timer_running()
end
function after_replay()
lcd_test_rpm_n2_gauge()
show_engine_exceedances_realtime()
engine_exceedance_value()
show_exceedances_after_eleven_s()
flash_NG_trend_arc()
flash_MGT_trend_arc()
flash_TRQ_trend_arc()
n2_rpm_animation()
fadec_bit_battery_on()
master_timer_running()
end