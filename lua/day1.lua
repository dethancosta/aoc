coords = {0, 0}
local f = io.open("day1.txt", "r")
--local f = io.open("test1.txt", "r")
if f == nil then
	os.exit(1)
end
dirs =
{
	[1] = 'N',
	[2] = 'E',
	[3] = 'S',
	[4] = 'W',
}
direction = 1
instruction = ''
visited = {}
visited["0 0"] = true
repeat
	local c = f:read(1)
	if c ~= "," and c ~= "\n" and c ~= " " and c ~= nil then
		instruction = instruction..c
	end
	if c == "," or c == nil then

		if string.sub(instruction,1,1) == "R" then
			direction = direction + 1
			if direction == 5 then
				direction = 1
			end
		elseif string.sub(instruction,1,1) == "L" then
			direction = direction - 1
			if direction == 0 then
				direction = 4
			end
		end

		local amount = tonumber(string.sub(instruction, 2,string.len(instruction)))
		if dirs[direction] == 'N' then
			for i = 1, amount, 1 do
				if visited[tostring(coords[1]).." "..tostring(coords[2] + i)] == true then
					print("Visited twice at distance of "..tostring(math.abs(coords[1]) + math.abs(coords[2] + i)))
					io.close(f)
					os.exit(0)
				else
					visited[tostring(coords[1]).." "..tostring(coords[2] + i)] = true
				end
			end
			coords[2] = coords[2] + amount
		elseif dirs[direction] == 'E' then
			for i = 1, amount, 1 do
				if visited[tostring(coords[1] + i).." "..tostring(coords[2])] == true then
					print("Visited twice at distance of "..tostring(math.abs(coords[1] + i) + math.abs(coords[2])))
					io.close(f)
					os.exit(0)
				else
					visited[tostring(coords[1] + i).." "..tostring(coords[2])] = true
				end
			end
			coords[1] = coords[1] + amount
		elseif dirs[direction] == 'S' then
			for i = 1, amount, 1 do
				if visited[tostring(coords[1]).." "..tostring(coords[2] - i)] == true then
					print("Visited twice at distance of "..tostring(math.abs(coords[1]) + math.abs(coords[2] - i)))
					io.close(f)
					os.exit(0)
				else
					visited[tostring(coords[1]).." "..tostring(coords[2] - i)] = true
				end
			end
			coords[2] = coords[2] - amount
		else
			for i = 1, amount, 1 do
				if visited[tostring(coords[1] - i).." "..tostring(coords[2])] == true then
					print("Visited twice at distance of "..tostring(math.abs(coords[1] - i) + math.abs(coords[2])))
					io.close(f)
					os.exit(0)
				else
					visited[tostring(coords[1] - i).." "..tostring(coords[2])] = true
				end
			end
			coords[1] = coords[1] - amount
		end

		instruction = ''
	end
until c == nil

io.close(f)

local distance = math.abs(coords[1]) + math.abs(coords[2])
print("Distance: "..distance)
