--
--  Script: Reset Adjustments for Selected Variants except temperature and tint
--  Created by: Yan Senez
--  Created on: 04/06/2023
--
-- This script is designed to reset all adjustments for the selected variants in Capture One except their temperature and tint values. 
-- It retrieves the selected variants, checks if any variants are selected, resets the adjustments, and then restores the temperature and tint values.
--
--  Copyright © 2023 Yan Senez Photographie, All Rights Reserved
--

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- Get a reference to the Capture One application
tell application "Capture One"
	
	-- Get the root folder of the current document
	set rootFolder to folder of current document
	
	-- Get the selected variants
	set selecVars to (get selected variants)
	
	-- Get a reference to the current document
	set currentDocument to current document
	
	-- Check if any variants are selected
	if selecVars is {} then
		try
			-- Display an error dialog if no variants are selected
			display dialog "No Variants selected!" buttons {Cancel} default button "Cancel" with icon stop with title "ERROR"
			return
		on error errMsg number errNum
			if errNum is -128 then return
		end try
	end if
	
	-- Reset adjustments and restore temperature and tint values
	repeat with v in selecVars
		
		-- Store the original temperature and tint values
		set temperatureValue to temperature of adjustments of v
		set tintValue to tint of adjustments of v
		
		-- Reset all adjustments for the variant
		reset adjustments v
		
		-- Restore the original temperature and tint values
		set temperature of adjustments of v to temperatureValue
		set tint of adjustments of v to tintValue
	end repeat
end tell