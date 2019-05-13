local project = 'https://gitlab.com/dennislysenko/ComputerCraft/raw/master/GPS%20Host/'
local handle = http.get(project..'directory')
while true do
	local line = handle.readLine()
	if line == nil then
		break
	end
	local file = fs.open(line, 'w')
	local gitFile = http.get(project..line)
	file.write(gitFile.readAll())
	file.close()
end
handle.close()
shell.run('startup.lua')
