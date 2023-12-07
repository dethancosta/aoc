function IsReal(name)
	local checksum = string.match(name, "%[%a*%]")
	local cutoff = string.find(name, checksum)
	if cutoff == nil then
		cutoff = #name+1
	end
	name = string.sub(name, cutoff-1)
	local counts = {}
	for i = 1, #name, 1 do
		local c = string.sub(name,i,i)
		if counts[c] == nil then
			counts[c] = 0
		end
		counts[c] = counts[c]+1
	end
end
