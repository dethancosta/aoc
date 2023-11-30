function PartOne()
	Keypad = {"1","2","3","4","5","6","7","8","9"}
	local f = io.open("day2.txt")
	local code = ""
	local cursor = 5

	repeat
		local c = f:read(1)
		if c == "\n" then
			code = code .. Keypad[cursor]
		elseif c == "U" and cursor >= 4 then
			cursor = cursor - 3
		elseif c == "D" and cursor <= 6 then
			cursor = cursor + 3
		elseif c == "L" and cursor%3 ~= 1 then
			cursor = cursor - 1
		elseif c == "R" and cursor%3 ~= 0 then
			cursor = cursor + 1
		end
	until c == nil
	io.close(f)

	print(code)
end

function PartTwo()
	Keypad = {
		["1"] = {["D"]="3"},
		["2"] = {["D"]="6", ["R"]="3"},
		["3"] = {["D"]="7", ["R"]="4", ["U"]="1", ["L"]="2"},
		["4"] = {["D"]="8", ["L"]="3"},
		["5"] = {["R"]="6"},
		["6"] = {["L"]="5", ["D"]="A", ["R"]="7", ["U"]="2"},
		["7"] = {["L"]="6", ["D"]="B", ["R"]="8", ["U"]="3"},
		["8"] = {["L"]="7", ["D"]="C", ["R"]="9", ["U"]="4"},
		["9"] = {["L"]="8"},
		["A"] = {["U"]="6", ["R"]="B"},
		["B"] = {["L"]="A", ["D"]="D", ["R"]="C", ["U"]="7"},
		["C"] = {["U"]="8", ["L"]="B"},
		["D"] = {["U"]="B"}
	}
	local f = io.open("day2.txt")
	local code = ""
	local cursor = "5"
	repeat
		local c = f:read(1)
		if c == "\n" then
			code = code..cursor
		elseif c ~= nil then
			local update = Keypad[cursor][c]
			if update ~= nil then
				cursor = update
			end
		end
	until c == nil

	print(code)
end

PartTwo()
