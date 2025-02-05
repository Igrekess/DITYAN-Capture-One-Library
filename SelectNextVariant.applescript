use application "Capture One"
try
	set currentVariant to primary variant
	set nextVariant to variant after currentVariant
	deselect current document variant currentVariant
	select current document variant nextVariant
end try
