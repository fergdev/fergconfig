local colors = require("colors")
local inspect = require("inspect")

local parse_string_to_table = function(s)
	local result = {}
	for line in s:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

local file = io.popen("aerospace list-workspaces --focused")
local result = file:read("*a")
file:close()

local workspaces = parse_string_to_table(result)
local workspace = workspaces[1]
local space = sbar.add("item", "space.areospace", {
	icon = {
		string = workspace,
		color = colors.white,
		padding_left = 4,
		padding_right = 4,
	},
	label = { drawing = false },
	padding_left = 8,
	padding_right = 8,
})

sbar.add("bracket", "space.aerospace.bracket", { space.name }, {
	background = { color = colors.bg1 },
})

space:subscribe("aerospace_workspace_change", function(env)
	space:set({
		icon = { string = env.FOCUSED_WORKSPACE, color = colors.white },
	})
end)
