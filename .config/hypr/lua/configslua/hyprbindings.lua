local hl = require("hyprland")

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi"
local m = "SUPER"

hl.bind(m, "Q", "exec", terminal)
hl.bind(m, "C", "killactive")
hl.bind(m, "M", "exec", "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
hl.bind(m, "E", "exec", fileManager)
hl.bind(m, "V", "togglefloating")
hl.bind(m, "R", "exec", menu .. " --show drun")
hl.bind(m .. " SHIFT", "R", "exec", menu .. " --show run")
hl.bind(m, "P", "pseudo")
hl.bind(m, "J", "layoutmsg", "togglesplit")
hl.bind(m .. " SHIFT", "comma", "exec", 'grim -g "$(slurp)" - | swappy -f -')
hl.bind(m, "L", "exec", "hyprlock")
hl.bind(m, "period", "exec", "wofi-emoji")
hl.bind(m, "B", "exec", "brave")
hl.bind(m, "N", "exec", "kitty -e nvim")
hl.bind(m, "G", "exec", "brave --app-id=gdfaincndogidkdcdkhapmbffkckdkhn")
hl.bind(
	m,
	"D",
	"exec",
	'vesktop --enable-low-end-device-mode --disable-renderer-backgrounding --js-flags="--max-old-space-size=256" --enable-features=UseOzonePlatform --ozone-platform=wayland'
)
hl.bind(m, "T", "exec", "spotify")
hl.bind(
	m .. " SHIFT",
	"C",
	"exec",
	'mpv /dev/video0 --title="webcam" --profile=low-latency --untimed --no-osc --no-osd-bar'
)
hl.bind("CTRL SHIFT", "Escape", "exec", "kitty -e btop")
hl.bind(m, "Escape", "exec", "pkill waybar && waybar &")
hl.bind(m, "comma", "exec", "kitty -e nvim ~/.config/hypr")
hl.bind(m .. " CTRL", "comma", "exec", "kitty -e nvim ~/.config/waybar")

hl.bind(m, "left", "movefocus", "l")
hl.bind(m, "right", "movefocus", "r")
hl.bind(m, "up", "movefocus", "u")
hl.bind(m, "down", "movefocus", "d")

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(m, key, "workspace", tostring(i))
	hl.bind(m .. " SHIFT", key, "movetoworkspace", tostring(i))
end

hl.bind(m, "S", "togglespecialworkspace", "magic")
hl.bind(m .. " SHIFT", "S", "movetoworkspace", "special:magic")
hl.bind(m, "mouse_down", "workspace", "e+1")
hl.bind(m, "mouse_up", "workspace", "e-1")

hl.bindm(m, "mouse:272", "movewindow")
hl.bindm(m, "mouse:273", "resizewindow")

hl.bindel("", "XF86AudioRaiseVolume", "exec", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
hl.bindel("", "XF86AudioLowerVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
hl.bindel("", "XF86AudioMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hl.bindel("", "XF86AudioMicMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hl.bindel("", "XF86MonBrightnessUp", "exec", "brightnessctl -e4 -n2 set 5%+")
hl.bindel("", "XF86MonBrightnessDown", "exec", "brightnessctl -e4 -n2 set 5%-")

hl.bindl("", "XF86AudioNext", "exec", "playerctl next")
hl.bindl("", "XF86AudioPause", "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPlay", "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPrev", "exec", "playerctl previous")
