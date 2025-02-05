use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

--···············································································································
--Task	   		:  Reset crop and rotation on selected variant(s) in Capture One
--Version	   	:  Capture one 
--···············································································································

tell application "Capture One"
	set SelectedImg to (get selected variants)
	repeat with Img in SelectedImg
		tell Img
			tell adjustments
				-- reset rotation
				set rotation to (0)
			end tell
			-- reset crop
			set crop center to {0, 0}
		end tell
	end repeat
end tell
