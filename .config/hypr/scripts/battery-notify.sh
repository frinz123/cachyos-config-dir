#!/usr/bin/env fish

# Ensure the script can talk to your notification daemon (Mako)
set -gx DBUS_SESSION_BUS_ADDRESS "unix:path=/run/user/"(id -u)"/bus"
set -gx WAYLAND_DISPLAY wayland-0

# Detect battery path (Standard for ASUS Vivobook)
if test -d /sys/class/power_supply/BAT0
    set bat "/sys/class/power_supply/BAT0"
else
    set bat "/sys/class/power_supply/BAT1"
end

set last_notified 0
set was_discharging 0

# Determine initial state so it doesn't "Thank" you just for turning the PC on
if test (cat $bat/status) = "Discharging"
    set was_discharging 1
end

while true
    set capacity (cat $bat/capacity)
    set bat_status (cat $bat/status)

    if test "$bat_status" = "Discharging"
        set was_discharging 1
        
        # Low Battery Warning (Normal)
        if test $capacity -le 30; and test $last_notified -ne 30; and test $capacity -gt 20
            notify-send "Laptop-chan" "User-kun, please charge me! i think i'm low on battery..." --urgency=normal
            set last_notified 30
        
        # Critical Battery Warning
        else if test $capacity -le 20; and test $last_notified -ne 20
            notify-send "Laptop-chan" "USER-KUN, PLEASE, CHARGE ME! I'M GONNA DIE :(" --urgency=critical
            set last_notified 20
        end
    else
        # THE INSTANT THANK YOU
        # Triggers only if we switched from Discharging to Charging/Full
        if test $was_discharging -eq 1
            notify-send "Laptop-chan" "Arigato, User-kun! (´｡• ᵕ •｡`) ♡" --urgency=low
            set was_discharging 0
        end
        
        # Reset the notification tracker so warnings fire again next time battery is low
        set last_notified 0
    end

    # 1-second interval for "Instant" feel without high CPU usage
    sleep 1
end
