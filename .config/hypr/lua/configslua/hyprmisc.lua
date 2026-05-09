local hl = require("hyprland")

hl.master({
	new_status = "master",
})

hl.misc({
	force_default_wallpaper = -1,
	disable_hyprland_logo = true,
})

hl.input({
	kb_layout = "us",
	follow_mouse = 1,
	sensitivity = 0,
	touchpad = {
		natural_scroll = false,
		disable_while_typing = false,
	},
})

hl.gesture(3, "horizontal", "workspace")
