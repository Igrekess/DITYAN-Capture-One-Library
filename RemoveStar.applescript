tell application "Capture One"
	set SelectedImg to (get selected variants)
	repeat with Img in SelectedImg
		tell Img
			set CurrentRating to get rating
			if CurrentRating > (0) then
				set rating to rating - 1
			end if
		end tell
	end repeat
end tell
