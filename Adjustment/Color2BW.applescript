use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Capture One"
	set variantList to variants whose selected is true
	set numVariants to count of variantList
	set varIndex to 1
	
	repeat until varIndex > numVariants
		(*
    If an error occurs, just go on to the next one.
    *)
		try
			set curVar to (a reference to (item varIndex of variantList))
			set curAdj to (a reference to (adjustments of curVar))
			(*
      Get current black & white setting and invert it.
      *)
			set curBW to black and white of curAdj
			set black and white of curAdj to not curBW
		end try
		set varIndex to varIndex + 1
	end repeat
end tell
