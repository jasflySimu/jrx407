-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- © JRX Design - JRX BELL 407 (22) - VIBRATION MODEL    ----------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Local Variables - Currently set to 60% of values
local g_speed_0		= 0.0165 / 100 * 60
local g_speed_1		= 0.0570 / 100 * 60
local g_speed_5		= 0.0555 / 100 * 60
local g_speed_10	= 0.0540 / 100 * 60
local g_speed_15	= 0.0525 / 100 * 60
local g_speed_20	= 0.0510 / 100 * 60
local g_speed_25	= 0.0495 / 100 * 60
local g_speed_30	= 0.0480 / 100 * 60
local g_speed_35	= 0.0465 / 100 * 60
local g_speed_40	= 0.0450 / 100 * 60
local g_speed_45	= 0.0435 / 100 * 60
local g_speed_50	= 0.0420 / 100 * 60
local g_speed_55	= 0.0405 / 100 * 60
local g_speed_60	= 0.0390 / 100 * 60
local g_speed_65	= 0.0375 / 100 * 60
local g_speed_70	= 0.0360 / 100 * 60
local g_speed_75	= 0.0345 / 100 * 60
local g_speed_80	= 0.0330 / 100 * 60
local g_speed_85	= 0.0315 / 100 * 60
local g_speed_90	= 0.0300 / 100 * 60
local g_speed_95	= 0.0285 / 100 * 60
local g_speed_100	= 0.0270 / 100 * 60
local g_speed_105	= 0.0255 / 100 * 60
local g_speed_110	= 0.0240 / 100 * 60
local g_speed_115	= 0.0225 / 100 * 60
local g_speed_120	= 0.0210 / 100 * 60
local g_speed_125	= 0.0195 / 100 * 60
local g_speed_130	= 0.0180 / 100 * 60
local g_speed_135	= 0.0585 / 100 * 60
local g_speed_140	= 0.0600 / 100 * 60
local g_speed_145	= 0.0615 / 100 * 60
local g_speed_150	= 0.0630 / 100 * 60
-- Find Custom Datarefs
dr_b407_vibration_x 			= find_dataref("jrxDR/407/misc/vibration/x")
dr_b407_vibration_y 			= find_dataref("jrxDR/407/misc/vibration/y")
dr_b407_vibration_z 			= find_dataref("jrxDR/407/misc/vibration/z")
dr_b407_vibration_controller 	= find_dataref("jrxDR/407/misc/vibration/xyz_reference")
set_vibration_level 			= find_dataref("jrxDR/407/misc/vibration_speed_set_vibration_level")
speed_0							= find_dataref("jrxDR/407/misc/vibration_speed_0")
speed_1							= find_dataref("jrxDR/407/misc/vibration_speed_1")
speed_5							= find_dataref("jrxDR/407/misc/vibration_speed_5")
speed_10						= find_dataref("jrxDR/407/misc/vibration_speed_10")
speed_15						= find_dataref("jrxDR/407/misc/vibration_speed_15")
speed_20						= find_dataref("jrxDR/407/misc/vibration_speed_20")
speed_25						= find_dataref("jrxDR/407/misc/vibration_speed_25")
speed_30						= find_dataref("jrxDR/407/misc/vibration_speed_30")
speed_35						= find_dataref("jrxDR/407/misc/vibration_speed_35")
speed_40						= find_dataref("jrxDR/407/misc/vibration_speed_40")
speed_45						= find_dataref("jrxDR/407/misc/vibration_speed_45")
speed_50						= find_dataref("jrxDR/407/misc/vibration_speed_50")
speed_55						= find_dataref("jrxDR/407/misc/vibration_speed_55")
speed_60						= find_dataref("jrxDR/407/misc/vibration_speed_60")
speed_65						= find_dataref("jrxDR/407/misc/vibration_speed_65")
speed_70						= find_dataref("jrxDR/407/misc/vibration_speed_70")
speed_75						= find_dataref("jrxDR/407/misc/vibration_speed_75")
speed_80						= find_dataref("jrxDR/407/misc/vibration_speed_80")
speed_85						= find_dataref("jrxDR/407/misc/vibration_speed_85")
speed_90						= find_dataref("jrxDR/407/misc/vibration_speed_90")
speed_95						= find_dataref("jrxDR/407/misc/vibration_speed_95")
speed_100						= find_dataref("jrxDR/407/misc/vibration_speed_100")
speed_105						= find_dataref("jrxDR/407/misc/vibration_speed_105")
speed_110						= find_dataref("jrxDR/407/misc/vibration_speed_110")
speed_115						= find_dataref("jrxDR/407/misc/vibration_speed_115")
speed_120						= find_dataref("jrxDR/407/misc/vibration_speed_120")
speed_125						= find_dataref("jrxDR/407/misc/vibration_speed_125")
speed_130						= find_dataref("jrxDR/407/misc/vibration_speed_130")
speed_135						= find_dataref("jrxDR/407/misc/vibration_speed_135")
speed_140						= find_dataref("jrxDR/407/misc/vibration_speed_140")
speed_145						= find_dataref("jrxDR/407/misc/vibration_speed_145")
speed_150						= find_dataref("jrxDR/407/misc/vibration_speed_150")
-- Find Default Datarefs
dr_b407_vibration_driver		= find_dataref("sim/flightmodel2/engines/engine_rotation_angle_deg[0]")
dr_b407_vibration_groundspeed	= find_dataref("sim/flightmodel2/position/groundspeed")
-- Variable Vibration Levels
function set_vibration_to_speed()
	if set_vibration_level == 0 then
		speed_0		= g_speed_0   * 0
		speed_1		= g_speed_1   * 0
		speed_5		= g_speed_5   * 0
		speed_10	= g_speed_10  * 0
		speed_15	= g_speed_15  * 0
		speed_20	= g_speed_20  * 0
		speed_25	= g_speed_25  * 0
		speed_30	= g_speed_30  * 0
		speed_35	= g_speed_35  * 0
		speed_40	= g_speed_40  * 0
		speed_45	= g_speed_45  * 0
		speed_50	= g_speed_50  * 0
		speed_55	= g_speed_55  * 0
		speed_60	= g_speed_60  * 0
		speed_65	= g_speed_65  * 0
		speed_70	= g_speed_70  * 0
		speed_75	= g_speed_75  * 0
		speed_80	= g_speed_80  * 0
		speed_85	= g_speed_85  * 0
		speed_90	= g_speed_90  * 0
		speed_95	= g_speed_95  * 0
		speed_100	= g_speed_100 * 0
		speed_105	= g_speed_105 * 0
		speed_110	= g_speed_110 * 0
		speed_115	= g_speed_115 * 0
		speed_120	= g_speed_120 * 0
		speed_125	= g_speed_125 * 0
		speed_130	= g_speed_130 * 0
		speed_135	= g_speed_135 * 0
		speed_140	= g_speed_140 * 0
		speed_145	= g_speed_145 * 0
		speed_150	= g_speed_150 * 0
	end
	
	if set_vibration_level == 1 then
		speed_0		= g_speed_0   * 1
		speed_1		= g_speed_1   * 1
		speed_5		= g_speed_5   * 1
		speed_10	= g_speed_10  * 1
		speed_15	= g_speed_15  * 1
		speed_20	= g_speed_20  * 1
		speed_25	= g_speed_25  * 1
		speed_30	= g_speed_30  * 1
		speed_35	= g_speed_35  * 1
		speed_40	= g_speed_40  * 1
		speed_45	= g_speed_45  * 1
		speed_50	= g_speed_50  * 1
		speed_55	= g_speed_55  * 1
		speed_60	= g_speed_60  * 1
		speed_65	= g_speed_65  * 1
		speed_70	= g_speed_70  * 1
		speed_75	= g_speed_75  * 1
		speed_80	= g_speed_80  * 1
		speed_85	= g_speed_85  * 1
		speed_90	= g_speed_90  * 1
		speed_95	= g_speed_95  * 1
		speed_100	= g_speed_100 * 1
		speed_105	= g_speed_105 * 1
		speed_110	= g_speed_110 * 1
		speed_115	= g_speed_115 * 1
		speed_120	= g_speed_120 * 1
		speed_125	= g_speed_125 * 1
		speed_130	= g_speed_130 * 1
		speed_135	= g_speed_135 * 1
		speed_140	= g_speed_140 * 1
		speed_145	= g_speed_145 * 1
		speed_150	= g_speed_150 * 1
	end
	
	if set_vibration_level == 2 then
		speed_0		= g_speed_0   * 1.8
		speed_1		= g_speed_1   * 1.8
		speed_5		= g_speed_5   * 1.8
		speed_10	= g_speed_10  * 1.8
		speed_15	= g_speed_15  * 1.8
		speed_20	= g_speed_20  * 1.8
		speed_25	= g_speed_25  * 1.8
		speed_30	= g_speed_30  * 1.8
		speed_35	= g_speed_35  * 1.8
		speed_40	= g_speed_40  * 1.8
		speed_45	= g_speed_45  * 1.8
		speed_50	= g_speed_50  * 1.8
		speed_55	= g_speed_55  * 1.8
		speed_60	= g_speed_60  * 1.8
		speed_65	= g_speed_65  * 1.8
		speed_70	= g_speed_70  * 1.8
		speed_75	= g_speed_75  * 1.8
		speed_80	= g_speed_80  * 1.8
		speed_85	= g_speed_85  * 1.8
		speed_90	= g_speed_90  * 1.8
		speed_95	= g_speed_95  * 1.8
		speed_100	= g_speed_100 * 1.8
		speed_105	= g_speed_105 * 1.8
		speed_110	= g_speed_110 * 1.8
		speed_115	= g_speed_115 * 1.8
		speed_120	= g_speed_120 * 1.8
		speed_125	= g_speed_125 * 1.8
		speed_130	= g_speed_130 * 1.8
		speed_135	= g_speed_135 * 1.8
		speed_140	= g_speed_140 * 1.8
		speed_145	= g_speed_145 * 1.8
		speed_150	= g_speed_150 * 1.8
	end
	
	if set_vibration_level == 3 then
		speed_0		= g_speed_0   * 2.6
		speed_1		= g_speed_1   * 2.6
		speed_5		= g_speed_5   * 2.6
		speed_10	= g_speed_10  * 2.6
		speed_15	= g_speed_15  * 2.6
		speed_20	= g_speed_20  * 2.6
		speed_25	= g_speed_25  * 2.6
		speed_30	= g_speed_30  * 2.6
		speed_35	= g_speed_35  * 2.6
		speed_40	= g_speed_40  * 2.6
		speed_45	= g_speed_45  * 2.6
		speed_50	= g_speed_50  * 2.6
		speed_55	= g_speed_55  * 2.6
		speed_60	= g_speed_60  * 2.6
		speed_65	= g_speed_65  * 2.6
		speed_70	= g_speed_70  * 2.6
		speed_75	= g_speed_75  * 2.6
		speed_80	= g_speed_80  * 2.6
		speed_85	= g_speed_85  * 2.6
		speed_90	= g_speed_90  * 2.6
		speed_95	= g_speed_95  * 2.6
		speed_100	= g_speed_100 * 2.6
		speed_105	= g_speed_105 * 2.6
		speed_110	= g_speed_110 * 2.6
		speed_115	= g_speed_115 * 2.6
		speed_120	= g_speed_120 * 2.6
		speed_125	= g_speed_125 * 2.6
		speed_130	= g_speed_130 * 2.6
		speed_135	= g_speed_135 * 2.6
		speed_140	= g_speed_140 * 2.6
		speed_145	= g_speed_145 * 2.6
		speed_150	= g_speed_150 * 2.6
	end
end

function b407_vibrations()

	dr_b407_vibration_controller = dr_b407_vibration_groundspeed * 1.94384449 -- meters / second to knots conversion

		if dr_b407_vibration_controller >= 0 then 
			if dr_b407_vibration_controller <= 1 then
				dr_b407_vibration_x = 	speed_0 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_0 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_0 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 1 then 
			if dr_b407_vibration_controller <= 5 then
				dr_b407_vibration_x = 	speed_1 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_1 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_1 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 5 then 
			if dr_b407_vibration_controller <= 10 then
				dr_b407_vibration_x = 	speed_5 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_5 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_5 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 10 then 
			if dr_b407_vibration_controller <= 15 then
				dr_b407_vibration_x = 	speed_10 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_10 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_10 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 15 then 
			if dr_b407_vibration_controller <= 20 then
				dr_b407_vibration_x = 	speed_15 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_15 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_15 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 20 then 
			if dr_b407_vibration_controller <= 25 then
				dr_b407_vibration_x = 	speed_20 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_20 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_20 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 25 then 
			if dr_b407_vibration_controller <= 30 then
				dr_b407_vibration_x = 	speed_25 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_25 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_25 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 30 then 
			if dr_b407_vibration_controller <= 35 then
				dr_b407_vibration_x = 	speed_30 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_30 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_30 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 35 then 
			if dr_b407_vibration_controller <= 40 then
				dr_b407_vibration_x = 	speed_35 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_35 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_35 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 40 then 
			if dr_b407_vibration_controller <= 45 then
				dr_b407_vibration_x = 	speed_40 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_40 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_40 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 45 then 
			if dr_b407_vibration_controller <= 50 then
				dr_b407_vibration_x = 	speed_45 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_45 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_45 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 50 then 
			if dr_b407_vibration_controller <= 55 then
				dr_b407_vibration_x = 	speed_50 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_50 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_50 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 55 then 
			if dr_b407_vibration_controller <= 60 then
				dr_b407_vibration_x = 	speed_55 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_55 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_55 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 60 then 
			if dr_b407_vibration_controller <= 65 then
				dr_b407_vibration_x = 	speed_60 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_60 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_60 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 65 then 
			if dr_b407_vibration_controller <= 70 then
				dr_b407_vibration_x = 	speed_65 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_65 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_65 * dr_b407_vibration_driver * 100 
			end
		end

		if dr_b407_vibration_controller >= 70 then 
			if dr_b407_vibration_controller <= 75 then
				dr_b407_vibration_x = 	speed_70 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_70 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_70 * dr_b407_vibration_driver * 100 
			end
		end
		if dr_b407_vibration_controller >= 75 then 
			if dr_b407_vibration_controller <= 80 then
				dr_b407_vibration_x = 	speed_75 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_75 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_75 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 80 then 
			if dr_b407_vibration_controller <= 85 then
				dr_b407_vibration_x = 	speed_80 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_80 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_80 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 85 then 
			if dr_b407_vibration_controller <= 90 then
				dr_b407_vibration_x = 	speed_85 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_85 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_85 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 90 then 
			if dr_b407_vibration_controller <= 95 then
				dr_b407_vibration_x = 	speed_90 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_90 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_90 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 95 then 
			if dr_b407_vibration_controller <= 100 then
				dr_b407_vibration_x = 	speed_95 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_95 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_95 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 100 then 
			if dr_b407_vibration_controller <= 105 then
				dr_b407_vibration_x = 	speed_100 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_100 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_100 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 105 then 
			if dr_b407_vibration_controller <= 110 then
				dr_b407_vibration_x = 	speed_105 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_105 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_105 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 110 then 
			if dr_b407_vibration_controller <= 115 then
				dr_b407_vibration_x = 	speed_110 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_110 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_110 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 115 then 
			if dr_b407_vibration_controller <= 120 then
				dr_b407_vibration_x = 	speed_115 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_115 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_115 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 120 then 
			if dr_b407_vibration_controller <= 125 then
				dr_b407_vibration_x = 	speed_120 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_120 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_120 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 125 then 
			if dr_b407_vibration_controller <= 130 then
				dr_b407_vibration_x = 	speed_125 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_125 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_125 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 130 then 
			if dr_b407_vibration_controller <= 135 then
				dr_b407_vibration_x = 	speed_130 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_130 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_130 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 135 then 
			if dr_b407_vibration_controller <= 140 then
				dr_b407_vibration_x = 	speed_135 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_135 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_135 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 140 then 
			if dr_b407_vibration_controller <= 145 then
				dr_b407_vibration_x = 	speed_140 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_140 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_140 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 145 then 
			if dr_b407_vibration_controller <= 150 then
				dr_b407_vibration_x = 	speed_145 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_145 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_145 * dr_b407_vibration_driver * 100 
			end
		end
		
		if dr_b407_vibration_controller >= 150 then 
			if dr_b407_vibration_controller <= 10000 then
				dr_b407_vibration_x = 	speed_150 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_y = 	speed_150 * dr_b407_vibration_driver * 100 
				dr_b407_vibration_z = 	speed_150 * dr_b407_vibration_driver * 100 
			end
		end
end

function after_physics()
	b407_vibrations()
	set_vibration_to_speed()
end

function after_replay()
	b407_vibrations()
	set_vibration_to_speed()
end