------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) Engine Exceedances
-- Script Coded By Troopie
-- Thanks from JRX for your help :)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function blank()

end
torque_nm 			= find_dataref("sim/cockpit2/engine/indicators/torque_n_mtr[0]")
n1_percent 			= find_dataref("jrxDR/407/engine/indicators/ng_value")
itt_deg 			= find_dataref("jrxDR/407/engine/engn_itt_value")
starter 			= find_dataref("sim/flightmodel2/engines/starter_is_running[0]")
acfpath 			= find_dataref("sim/aircraft/view/acf_relative_path")
cmd_gear_on_ground	= find_dataref("sim/cockpit2/tcas/targets/position/weight_on_wheels[0]")
cmd_burning			= find_dataref("sim/flightmodel2/engines/engine_is_burning_fuel[0]")
--dr_itt_value		= find_dataref("sim/cockpit2/engine/indicators/ITT_deg_C[0]")
--
dr_torque_percent 	= create_dataref("jrxDR/407/engine/trq_percent","number",blank)
trqex 				= create_dataref("jrxDR/407/engine/exceedance_value_TRQ","number",blank)
ngex 				= create_dataref("jrxDR/407/engine/exceedance_value_NG","number",blank)
mgtex 				= create_dataref("jrxDR/407/engine/exceedance_value_MGT","number",blank)
function init_exceedance_vals()
	trqex = 0
	ngex = 0
	mgtex = 0
end

local trqex_min = 100.1
local ngex_min = 106
local ngex_min2 = 107
local mgtex_min = 727
local mgtex_min2 = 779
local n1_flag = 0
local itt_flag = 0
local path = string.sub(acfpath, 1, -12)	--third argument must equal (-1 - (the number of characters in the acf file name))
print('path = '..path)

function clear_trq_handler(phase, duration)
	if phase == 0 then
		if cmd_gear_on_ground == 1 then
			if cmd_burning == 0 then
				trqex = 0
			end
		end
	end
end
cmdresettrq = create_command("407/Menu/Exceedances/clear_TRQ","Clear Torque exceedance",clear_trq_handler)

function clear_ng_handler(phase, duration)
	if phase == 0 then
		if cmd_gear_on_ground == 1 then
			if cmd_burning == 0 then
				ngex = 0
			end
		end
	end
end

cmdresetng = create_command("407/Menu/Exceedances/clear_NG","Clear NG exceedance",clear_ng_handler)

function clear_mgt_handler(phase, duration)
	if phase == 0 then
		if cmd_gear_on_ground == 1 then
			if cmd_burning == 0 then
				mgtex = 0
			end
		end
	end
end

cmdresetmgt = create_command("407/Menu/Exceedances/clear_MGT","Clear MGT exceedance",clear_mgt_handler)
------------- TRQ Adjustment Here -------------------------------------------------------------------------------------
function trq_to_percent()
	local tnm = torque_nm
	if tnm == 0 then
		dr_torque_percent = 0
	else
		dr_torque_percent = ((tnm / 19659) * 130)	-- 10988 16482
		--dr_torque_percent = ((tnm / 23000) * 100)
	end
end

function trq()
	local dtp = dr_torque_percent
	if dtp > trqex_min then
		if dtp > trqex then trqex = dtp end
	end
end

function n1_timer_flag()
	if n1_percent > ngex then
		ngex = n1_percent
	end
end

function ng()
	local n1p = n1_percent
	if n1p >= ngex_min and n1p < ngex_min2 then
		if n1_flag == 0 then
			run_after_time(n1_timer_flag, 10)
			n1_flag = 1
		end
	else
		stop_timer(n1_timer_flag)
		n1_flag = 0
	end
	if n1p >= ngex_min2 then
		if n1p > ngex then ngex = n1p end
	end
end

function itt_timer_flag()
	if itt_deg > mgtex and starter == 0 then
		mgtex = itt_deg
	end
end

function mgt()
	local ittd = itt_deg
	if ittd >= mgtex_min and ittd <= mgtex_min2 then
		if itt_flag == 0 then
			run_after_time(itt_timer_flag, 300) --5 minutes
			itt_flag = 1
		end
	else
		stop_timer(itt_timer_flag)
		itt_flag = 0
	end
	if ittd > mgtex_min2 then
		if ittd > mgtex and starter == 0 then mgtex = ittd end
	end
end

function write_exceedance_file()
	local exvals = io.open(path.."JRX_B407_engine_exceedances.txt", "w")
	exvals:write(
		"JRX B407 engine exceedances values:","\n",
		trqex,"\n",
		ngex,"\n",
		mgtex,"\n"
	)
	exvals:close()
end

function read_exceedance_file()
	local fault = false
	local exvals = io.open(path.."JRX_B407_engine_exceedances.txt", "r")
	if exvals == nil then
		print("B407: JRX_B407_engine_exceedances.txt not found. Recreating the file now.")
		init_exceedance_vals()
		write_exceedance_file()
	else
		print("B407: reading engine exceedance values")
		exvals:read("*l")
		local ltrqex = exvals:read("*n")
		if type(ltrqex) == "number" then
			if ltrqex > trqex_min or ltrqex == 0 then
				trqex = ltrqex
			else
				fault = true
			end
		else
			fault = true
		end
		exvals:read("*l")
		local lngex = exvals:read("*n")
		if type(lngex) == "number" then
			if lngex > ngex_min or lngex == 0 then
				ngex = lngex
			else
				fault = true
			end
		else
			fault = true
		end
		exvals:read("*l")
		local lmgtex = exvals:read("*n")
		if type(lmgtex) == "number" then
			if lmgtex > mgtex_min or lmgtex == 0 then
				mgtex = lmgtex
			else
				fault = true
			end
		else
			fault = true
		end
		exvals:close()
		if fault == true then
			print("B407: error in JRX_B407_engine_exceedances.txt; Recreating the file now.")
			init_exceedance_vals()
			write_exceedance_file()
		end
	end
end

function flight_start()
	read_exceedance_file()
end

function after_physics()
	trq_to_percent()
	trq()
	ng()
	mgt()
end

function after_replay()
	trq_to_percent()
	trq()
	ng()
	mgt()
end

function aircraft_unload()
	write_exceedance_file()
end
