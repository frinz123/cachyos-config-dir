local hl = require("hyprland")

hl.source("~/.cache/wal/colors-hyprland.conf")

hl.general({
	gaps_in = 5,
	gaps_out = 20,
	border_size = 3,
	["col.active_border"] = "$color15 $color13 45deg",
	["col.inactive_border"] = "$color8",
	resize_on_border = true,
	allow_tearing = false,
	layout = "dwindle",
})

hl.decoration({
	rounding = 15,
	rounding_power = 2,
	active_opacity = 1,
	inactive_opacity = 1,
	shadow = {
		enabled = false,
		range = 4,
		render_power = 3,
		color = "rgba(1a1a1aee)",
	},
	blur = {
		enabled = true,
		size = 3,
		passes = 1,
		vibrancy = 0.1696,
	},
})

hl.dwindle({
	pseudotile = true,
	preserve_split = true,
	force_split = 2,
})

hl.windowrule({
	name = "suppress-maximize-events",
	["match:class"] = ".*",
	suppress_event = "maximize",
})

hl.windowrule({
	name = "fix-xwayland-drags",
	["match:class"] = "^$",
	["match:title"] = "^$",
	["match:xwayland"] = true,
	["match:float"] = true,
	["match:fullscreen"] = false,
	["match:pin"] = false,
	no_focus = true,
})

hl.windowrule({
	name = "move-hyprland-run",
	["match:class"] = "hyprland-run",
	move = "20 monitor_h-120",
	float = true,
})

hl.windowrule({
	name = "webcam-style",
	["match:title"] = "^(webcam)$",
	float = true,
	size = "1000 560",
	move = "100%-410 50",
})
