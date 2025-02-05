use application "Capture One"
try
	set currentVariant to primary variant
	set nextVariant to variant before currentVariant
	deselect current document variant currentVariant
	select current document variant nextVariant
end try
