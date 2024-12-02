-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- © JRX Design - JRX BELL 407 (22) - TRIM FUNCTIONS   CREDITS FLY AGI DE------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- dataref access
ftu_yoke_pitch_ratio 		= find_dataref("sim/cockpit2/controls/yoke_pitch_ratio")
ftu_yoke_roll_ratio 		= find_dataref("sim/cockpit2/controls/yoke_roll_ratio")
ftu_yoke_heading_ratio 		= find_dataref("sim/cockpit2/controls/yoke_heading_ratio")
ftu_elevator_trim	 		= find_dataref("sim/cockpit2/controls/elevator_trim")
ftu_aileron_trim	 		= find_dataref("sim/cockpit2/controls/aileron_trim")
ftu_rudder_trim	 			= find_dataref("sim/cockpit2/controls/rudder_trim")
ftu_force_trim_power_sw	 	= find_dataref("jrxDR/407/overhead/switches/force_trim_power")


-- configuration / aircraft dependent parameters ------------------------------------------------------------------------
local ftu_force_trim_heading_on = true 						-- includes heading/yaw axis in force trim, values true/false
local ftu_force_trim_method = "trim"						-- force trim method, using either virtual trim tabs (value "trim") or controls the cyclic directly (value "cyclic" ), method "trim" is smoother and recommended, method "cyclic" is experimental
local ftu_force_trim_target_roll_multi = 1.75				-- multiplier translating yoke_roll_ratio into aileron_trim (needed for trim method)
local ftu_force_trim_target_pitch_multi = 1.75				-- multiplier translating yoke_pitch_ratio into elevator_trim (needed for trim method)
local ftu_force_trim_target_heading_multi = 1.0				-- multiplier translating yoke_heading_ratio into rudder_trim (needed for trim method)
local ftu_force_trim_center = 0.05							-- center zone for neutral position checking (needed for cyclic method)
local ftu_trim_sensitivity = 0.0010							-- trim adjustment sensitivity for the custom trim buttons (needed for cyclic method, recommended for trim method)
-- internal parameters ----------------------------------------------------------------------------------------------------
local ftu_force_trim_active = false
local ftu_force_trim_target_roll = 0
local ftu_force_trim_target_pitch = 0
local ftu_force_trim_target_heading = 0
local ftu_force_trim_roll_null = false
local ftu_force_trim_pitch_null = false
local ftu_force_trim_heading_null = false
local ftu_force_trim_cyclic_null = true
-- force trim release ---------------------------------------------------------------------------------------------------
function ftu_force_trim_release()
	if ftu_force_trim_power_sw == 1 then
		if ftu_force_trim_method == "trim" then
			ftu_aileron_trim =  0
			ftu_elevator_trim = 0
			if ftu_force_trim_heading_on then
				ftu_rudder_trim = 0
			end
		end
	end		
	ftu_force_trim_active = false
end
-- force trim prep / on button press --------------------------------------------------------------------------------------
function ftu_force_trim_prep()
	if ftu_force_trim_power_sw == 1 then
		if ftu_force_trim_method == "trim" then
			if ftu_force_trim_active then
				ftu_force_trim_target_roll = ftu_aileron_trim/ftu_force_trim_target_roll_multi + ftu_yoke_roll_ratio
				ftu_force_trim_target_pitch = ftu_elevator_trim/ftu_force_trim_target_pitch_multi + ftu_yoke_pitch_ratio
				ftu_force_trim_target_heading = ftu_rudder_trim/ftu_force_trim_target_heading_multi + ftu_yoke_heading_ratio			
			else
				ftu_force_trim_target_roll = ftu_yoke_roll_ratio
				ftu_force_trim_target_pitch = ftu_yoke_pitch_ratio
				ftu_force_trim_target_heading = ftu_yoke_heading_ratio
				ftu_force_trim_active = true
			end
		else
			ftu_force_trim_target_roll = ftu_yoke_roll_ratio
			ftu_force_trim_target_pitch = ftu_yoke_pitch_ratio
			ftu_force_trim_target_heading = ftu_yoke_heading_ratio
			ftu_force_trim_active = true
		end
	end		
end
-- force trim / on button hold ------------------------------------------------------------------------------------------------
function ftu_force_trim()
	if ftu_force_trim_power_sw == 1 then
		if ftu_force_trim_method == "trim" then
			if ftu_force_trim_active then
				ftu_aileron_trim = (ftu_force_trim_target_roll - ftu_yoke_roll_ratio)*ftu_force_trim_target_roll_multi
				ftu_elevator_trim = (ftu_force_trim_target_pitch - ftu_yoke_pitch_ratio)*ftu_force_trim_target_pitch_multi
				if ftu_force_trim_heading_on then
				ftu_rudder_trim = (ftu_force_trim_target_heading - ftu_yoke_heading_ratio)*ftu_force_trim_target_heading_multi
				end
			end	
		else
			ftu_yoke_roll_ratio = ftu_force_trim_target_roll
			ftu_yoke_pitch_ratio = ftu_force_trim_target_pitch
			if ftu_force_trim_heading_on then
				ftu_yoke_heading_ratio = ftu_force_trim_target_heading
			end
		end
	end		
end
-- cyclic logic (not needed with trim method) -------------------------------------------------------------------------------------
function ftu_force_trim_cyclic()
	if ftu_force_trim_power_sw == 1 then
		if ftu_force_trim_method == "cyclic" then
	
			if ftu_force_trim_active then
		
			-- check null cyclic -------------------------------------
			
				if ftu_yoke_roll_ratio > -ftu_force_trim_center and ftu_yoke_roll_ratio < ftu_force_trim_center then
					ftu_force_trim_roll_null_true = true
				else
					ftu_force_trim_roll_null_true = false
				end
			
			
				if ftu_yoke_pitch_ratio > -ftu_force_trim_center and ftu_yoke_pitch_ratio < ftu_force_trim_center then
					ftu_force_trim_pitch_null_true = true
				else
					ftu_force_trim_pitch_null_true = false
				end
			
			
			
				if ftu_force_trim_roll_null_true and ftu_force_trim_pitch_null_true then
					ftu_force_trim_cyclic_null_true = true
				else
					ftu_force_trim_cyclic_null_true = false			
				end
			
			
			-- check null heading -------------------------------------
	
				if ftu_yoke_heading_ratio > -ftu_force_trim_center and ftu_yoke_heading_ratio < ftu_force_trim_center then
					ftu_force_trim_pitch_null_true = true
				else
					ftu_force_trim_pitch_null_true = false
				end
			
			
			-- force trim ---------------------------------------------
			
			
				if ftu_force_trim_cyclic_null_true then
					ftu_yoke_roll_ratio = ftu_force_trim_target_roll
					ftu_yoke_pitch_ratio = ftu_force_trim_target_pitch
				end
			
				if ftu_force_trim_heading_on then
					if ftu_force_trim_pitch_null_true then
						ftu_yoke_heading_ratio = ftu_force_trim_target_heading
					end
				end
			end									
		end
	end		
end
------------------------------------------------------------------------------------------------------------------------------------
-- command handlers ----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- phase = 0 		on button press
-- phase = 1		on button hold
-- phase = 2 		on button release
-------------------------------------------------------------------------------------------------------------------------------------
-- force trim release ---------------------------------------------------------------------------------------------------------------
function ftu_force_trim_release_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 then 			-- on button press
			ftu_force_trim_release()
		end
	end	
end
-- force trim -------------------------------------------------------------------------------------------------------------------------

function ftu_force_trim_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 then 			-- on button press
			ftu_force_trim_prep()
		elseif phase == 1 then 		-- on button hold
			ftu_force_trim()
		end
	end
end
-- trim buttons -------------------------------------------------------------------------------------------------------------------------
-- Trim Commands ------------------------------
-- Pitch --------------------------------------
function inc_ftu_force_trim_pitch_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_elevator_trim = ftu_elevator_trim + ftu_trim_sensitivity
			else
				ftu_yoke_pitch_ratio = ftu_yoke_pitch_ratio + ftu_trim_sensitivity
				if ftu_yoke_pitch_ratio >= 1 then
				ftu_yoke_pitch_ratio = 1
				end
			end
		end
	end
end
function dec_ftu_force_trim_pitch_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_elevator_trim = ftu_elevator_trim - ftu_trim_sensitivity
			else
				ftu_yoke_pitch_ratio = ftu_yoke_pitch_ratio - ftu_trim_sensitivity
				if ftu_yoke_pitch_ratio <= -1 then
					ftu_yoke_pitch_ratio = -1
				end
			end
		end
	end
end
-- Roll -------------------------------			   
function inc_ftu_force_trim_roll_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_aileron_trim = ftu_aileron_trim + ftu_trim_sensitivity
			else
				ftu_yoke_roll_ratio = ftu_yoke_roll_ratio + ftu_trim_sensitivity
				if ftu_yoke_roll_ratio >= 1 then
					ftu_yoke_roll_ratio = 1
				end
			end
		end
	end	
end
function dec_ftu_force_trim_roll_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_aileron_trim = ftu_aileron_trim - ftu_trim_sensitivity
			else
				ftu_yoke_roll_ratio = ftu_yoke_roll_ratio - ftu_trim_sensitivity
				if ftu_yoke_roll_ratio <= -1 then
					ftu_yoke_roll_ratio = -1
				end
			end
		end
	end
end
-- Yaw -----------------------------			   
function inc_ftu_force_trim_heading_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_rudder_trim = ftu_rudder_trim + ftu_trim_sensitivity
			else
				ftu_yoke_heading_ratio = ftu_yoke_heading_ratio + ftu_trim_sensitivity
				if ftu_yoke_heading_ratio >= 1 then
					ftu_yoke_heading_ratio = 1
				end
			end
		end
	end	
end
function dec_ftu_force_trim_heading_cmdh(phase, duration)
	if ftu_force_trim_power_sw == 1 then
		if phase == 0 or phase == 1 then
			if ftu_force_trim_method == "trim" then
				ftu_rudder_trim = ftu_rudder_trim - ftu_trim_sensitivity
			else
				ftu_yoke_heading_ratio = ftu_yoke_heading_ratio - ftu_trim_sensitivity
				if ftu_yoke_heading_ratio <= -1 then
					ftu_yoke_heading_ratio = -1
				end
			end
		end
	end
end
-- commands ---------------------------------------------------------------------------------------------------------------------------
cmd_ftu_force_trim_release		 		= create_command("407/Switches/Controls/force_trim_0_release", "JRX B407 - Switch - Force Trim - Release → ←", ftu_force_trim_release_cmdh)
cmd_ftu_force_trim				 		= create_command("407/Switches/Controls/force_trim_1_enable", "JRX B407 - Switch - Force Trim - Active ← →", ftu_force_trim_cmdh)
cmd_inc_ftu_force_trim_pitch_cmdh 		= create_command("407/Switches/Controls/force_trim_2_pitch_up", "JRX B407 - Switch - Trim - Nose Up ↑", inc_ftu_force_trim_pitch_cmdh)
cmd_dec_ftu_force_trim_pitch_cmdh 		= create_command("407/Switches/Controls/force_trim_3_pitch_dn", "JRX B407 - Switch - Trim - Nose Down ↓", dec_ftu_force_trim_pitch_cmdh)
cmd_inc_ftu_force_trim_roll_cmdh 		= create_command("407/Switches/Controls/force_trim_4_roll_rt", "JRX B407 - Switch - Trim - Roll Right →", inc_ftu_force_trim_roll_cmdh)
cmd_dec_ftu_force_trim_roll_cmdh 		= create_command("407/Switches/Controls/force_trim_5_roll_lf", "JRX B407 - Switch - Trim - Roll Left ←", dec_ftu_force_trim_roll_cmdh)
cmd_inc_ftu_force_trim_heading_cmdh 	= create_command("407/Switches/Controls/force_trim_6_yaw_rt", "JRX B407 - Switch - Trim - Yaw Right →", inc_ftu_force_trim_heading_cmdh)
cmd_dec_ftu_force_trim_heading_cmdh 	= create_command("407/Switches/Controls/force_trim_7_yaw_lf", "JRX B407 - Switch - Trim - Yaw Left ←", dec_ftu_force_trim_heading_cmdh)
-- runtime code ---------------------------------------------------------------------------------------------------------------------------
--function after_physics()
--	ftu_force_trim_cyclic()			-- cyclic method logic, if not needed disable by commenting out
--end