----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JRX BELL 407 (22) Aircraft Livery / ID Generation  ---------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- If you make a livery and want the aircraft ID / Registration number displayed in the radio panels (These radios can do this IRL) then add your livery ID here under the livery index number.
-- ** You need to keep your liveries in the correct order in the folder so they correspond to this file **

-- Local Variables
--#########################################
--#########################################
local livery_index_number_0		= "N39CL"
local livery_index_number_1		= "D-HACC"
local livery_index_number_2		= "C-GALR"
local livery_index_number_3		= "N407AH"
local livery_index_number_4		= "N374AL - Air Life"
local livery_index_number_5		= "N137PD"
local livery_index_number_6		= "N513MT"
local livery_index_number_7		= "N720CL"
local livery_index_number_8		= "G-CLAS"
local livery_index_number_9		= "SN-80XP"
local livery_index_number_10	= "N705MT"
local livery_index_number_11	= "N62ZA"
local livery_index_number_12	= "PT-YZJ"
local livery_index_number_13	= "F-GLHT"
local livery_index_number_14	= "N493AE"
local livery_index_number_15	= "D-HISF"
local livery_index_number_16	= "G-CHGK"
local livery_index_number_17	= "ZM257"
local livery_index_number_18	= "N722MT"
local livery_index_number_19	= "C-GDOT"
local livery_index_number_20	= "CG-6057"
local livery_index_number_21	= "N12345"
--#########################################
--#########################################
--Find Datarefs
dr_livery_index_index					= find_dataref("sim/aircraft/view/acf_livery_index")		-- Index number taken from the order in the liveries folder
dr_livery_index_flight_id 				= find_dataref("sim/cockpit2/radios/actuators/flight_id")	-- Displays the current flight ID in cockpit
dr_livery_index_tcas_id 				= find_dataref("sim/cockpit2/tcas/targets/flight_id")		-- Displays the current TCAS ID
--Create Dataref
dr_livery_index_flight_id_string		= create_dataref("jrxDR/407/panels/flight_id", "string")
-- Logic To Populate Aircraft IDs
function get_livery_index()
--
	dr_livery_index_flight_id	= dr_livery_index_flight_id_string
	dr_livery_index_tcas_id		= dr_livery_index_flight_id_string
--
	if dr_livery_index_index == 0 then
		dr_livery_index_flight_id_string 	= livery_index_number_0
	end
	if dr_livery_index_index == 1 then
		dr_livery_index_flight_id_string 	= livery_index_number_1
	end
	if dr_livery_index_index == 2 then
		dr_livery_index_flight_id_string 	= livery_index_number_2
	end
	if dr_livery_index_index == 3 then
		dr_livery_index_flight_id_string 	= livery_index_number_3
	end
	if dr_livery_index_index == 4 then
		dr_livery_index_flight_id_string 	= livery_index_number_4
	end
	if dr_livery_index_index == 5 then
		dr_livery_index_flight_id_string 	= livery_index_number_5
	end
	if dr_livery_index_index == 6 then
		dr_livery_index_flight_id_string 	= livery_index_number_6
	end
	if dr_livery_index_index == 7 then
		dr_livery_index_flight_id_string 	= livery_index_number_7
	end
	if dr_livery_index_index == 8 then
		dr_livery_index_flight_id_string 	= livery_index_number_8
	end
	if dr_livery_index_index == 9 then
		dr_livery_index_flight_id_string 	= livery_index_number_9
	end
	if dr_livery_index_index == 10 then
		dr_livery_index_flight_id_string 	= livery_index_number_10
	end
	if dr_livery_index_index == 11 then
		dr_livery_index_flight_id_string 	= livery_index_number_11
	end
	if dr_livery_index_index == 12 then
		dr_livery_index_flight_id_string 	= livery_index_number_12
	end
	if dr_livery_index_index == 13 then
		dr_livery_index_flight_id_string 	= livery_index_number_13
	end
	if dr_livery_index_index == 14 then
		dr_livery_index_flight_id_string 	= livery_index_number_14
	end
	if dr_livery_index_index == 15 then
		dr_livery_index_flight_id_string 	= livery_index_number_15
	end
	if dr_livery_index_index == 16 then
		dr_livery_index_flight_id_string 	= livery_index_number_16
	end
	if dr_livery_index_index == 17 then
		dr_livery_index_flight_id_string 	= livery_index_number_17
	end
	if dr_livery_index_index == 18 then
		dr_livery_index_flight_id_string 	= livery_index_number_18
	end
	if dr_livery_index_index == 19 then
		dr_livery_index_flight_id_string 	= livery_index_number_19
	end
	if dr_livery_index_index == 20 then
		dr_livery_index_flight_id_string 	= livery_index_number_20
	end
	if dr_livery_index_index == 21 then
		dr_livery_index_flight_id_string 	= livery_index_number_21
	end
end	
function after_physics()
get_livery_index()
end
function after_replay()
get_livery_index()
end