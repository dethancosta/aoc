string = require('string')

function IsTriangle(s1, s2, s3)
	return s1+s2 > s3 and s1+s3 > s2 and s2+s3 > s1
end

function CountTriangles(filename)
	local f = io.open(filename)
	if f == nil then
		os.exit(1)
	end
	local count = 0
	local line = ""
	local idx = 0
	local sides = {}
	repeat
		idx = idx + 1
		line = f:read("*l")
		if line ~= nil and string.len(line) > 0 then
			while string.len(line) > 0 do
				local n = string.match(line, "(%d+)(%s*)")
				table.insert(sides, tonumber(n))
				line = string.sub(line, string.find(line, n)+string.len(n)+1)
			end
		end

		if #sides == 9 then
			if IsTriangle(sides[1],sides[4], sides[7]) then count = count+1 end
			if IsTriangle(sides[2],sides[5], sides[8]) then count = count+1 end
			if IsTriangle(sides[3],sides[6], sides[9]) then count = count+1 end
			sides = {}
		end
	until line == nil

	io.close(f)

	return count
end

local numTriangles = CountTriangles('day3.txt')
print(numTriangles)
