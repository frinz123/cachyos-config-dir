local hl = require("hyprland")

require("lua.configslua.hyprbindings")
require("lua.configslua.hyprwindows")
require("lua.configslua.hypranimations")
require("lua.configslua.hyprmisc")

hl.monitor("", "preferred", "auto", 1)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

hl.exec_once("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_once("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_once("mako")
hl.exec_once("/usr/lib/pam_kwallet_init")
hl.exec_once("awww-daemon && sleep 1 && awww img ~/Pictures/Wallpapers/1268195.png")
hl.exec_once("wal -R")
hl.exec_once("waybar")
hl.exec_once("pkill battery-notify.sh; ~/.config/hypr/scripts/battery-notify.sh")
hl.exec_once("hyprctl setcursor Bibata-Modern-Classic 24")
hl.exec_once("hypridle")
