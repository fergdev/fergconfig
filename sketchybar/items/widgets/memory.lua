local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

sbar.exec(
	"killall memory_load >/dev/null; $CONFIG_DIR/helpers/event_providers/memory_load/bin/memory_load memory_update 2.0"
)

local memory = sbar.add("item", "widgets.memory", {
	position = "right",
	icon = {
		string = icons.memory,
		-- padding_right = 0,
		-- font = {
		-- 	style = settings.font.style_map["Bold"],
		-- 	size = 9.0,
		-- },
	},
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	label = {
		string = "mem ??%",
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		align = "right",
		padding_right = 0,
		-- width = 0,
		y_offset = 4,
	},
	padding_right = settings.paddings + 6,
	-- padding_left = settings.paddings + 6,
})

memory:subscribe("memory_update", function(env)
	memory:set({
		label = "mem " .. env.percent .. "%",
	})
end)

-- Background around the cpu item
sbar.add("bracket", "widgets.memory.bracket", { memory.name }, {
	background = { color = colors.bg1 },
})

-- Background around the cpu item
sbar.add("item", "widgets.memeory.padding", {
	position = "right",
	width = settings.group_paddings,
})
